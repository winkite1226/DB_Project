CREATE OR REPLACE PROCEDURE InsertEnroll(sStudentId IN VARCHAR2, sCourseId IN VARCHAR2, nCourseIdNo IN NUMBER, result OUT VARCHAR2)
IS
	too_many_sumCourseUnit EXCEPTION;
	too_many_courses EXCEPTION;
	too_many_students EXCEPTION;
	duplicate_time EXCEPTION;
	nYear NUMBER;
	nSemester NUMBER;
	nSumCourseUnit NUMBER;
	nCourseUnit NUMBER;
	nCnt NUMBER;
	kCnt NUMBER;
	nTeachMax NUMBER;
BEGIN
	result:='';
	DBMS_OUTPUT.PUT_LINE('#');
	DBMS_OUTPUT.PUT_LINE(sStudentId||' 님이 과목번호 '||sCourseId||', 분반 '||TO_CHAR(nCourseIdNo)||'의 수강 등록을 요청하였습니다.');
	/*신청한 날 기준 신청 가능한 연도와 학기 계산*/
	nYear:=Date2EnrollYear(SYSDATE);
	nSemester:=Date2EnrollSemester(SYSDATE);
	
	/*예외 처리1 : 최대학점 초과*/ 
	SELECT SUM(t.c_unit)
	INTO nSumCourseUnit
	FROM teach t, enroll e
	WHERE e.s_id=sStudentId and e.c_year=nYear and e.c_semester=nSemester and e.c_id=t.c_id and e.c_id_no=t.c_id_no;
	
	SELECT c_unit
	INTO nCourseUnit
	FROM teach
	WHERE c_id=sCourseId and c_id_no=nCourseIdNo;
	
	IF (nSumCourseUnit+nCourseUnit>18) THEN
		RAISE too_many_sumCourseUnit;
	END IF;
	
	/*예외 처리2 : 동일한 과목 신청 여부*/
	SELECT COUNT(*)
	INTO nCnt
	FROM enroll
	WHERE s_id=sStudentId and c_id=sCourseId;
	
	IF (nCnt>0) THEN
		RAISE too_many_courses;
	END IF;
	
	/*예외 처리3 : 수강신청 인원 초과 여부*/
	SELECT c_num
	INTO nTeachMax
	FROM teach
	WHERE c_year=nYear and c_semester=nSemester and c_id=sCourseId and c_id_no=nCourseIdNo;
	
	SELECT COUNT(*)
	INTO nCnt
	FROM enroll
	WHERE c_year=nYear and c_semester=nSemester and c_id=sCourseId and c_id_no=nCourseIdNo;
	
	IF (nCnt>=nTeachMax) THEN
		RAISE too_many_students;
	END IF;
	
	/*예외 처리4 : 신청한 과목들 시간 중복 여부*/
	SELECT COUNT(*)
	INTO kCnt
	FROM
	(
		SELECT c_time, c_day
		FROM teach
		WHERE c_year=nYear and c_semester=nSemester and
				c_id=sCourseId and c_id_no=nCourseIdNo
		INTERSECT
		SELECT t.c_time, t.c_day
		FROM teach t, enroll e
		WHERE e.s_id=sStudentId and e.c_year=nYear and e.c_semester=nSemester and
				t.c_year=nYear and t.c_semester=nSemester and e.c_id=t.c_id and e.c_id_no=t.c_id_no
	);
	IF (kCnt>0)
	THEN
		RAISE duplicate_time;
	END IF;
	
 	/* 수강 신청 등록 */
 	INSERT INTO enroll(s_id, c_id, c_id_no, c_year, c_semester) VALUES (sStudentId, sCourseId, nCourseIdNo, nYear, nSemester);
	COMMIT;
 	result := '수강신청 등록이 완료되었습니다.';
 	
 	EXCEPTION
 		WHEN too_many_sumCourseUnit THEN
 			result := '최대학점을 초과하였습니다';
 		WHEN too_many_courses THEN
 			result := '이미 등록된 과목을 신청하였습니다';
 		WHEN too_many_students THEN
 			result := '수강신청 인원이 초과되어 등록이 불가능합니다';
 		WHEN duplicate_time THEN
 			result := '이미 등록된 과목 중 중복되는 시간이 존재합니다';
 		WHEN OTHERS THEN
 			ROLLBACK;
 			result := SQLCODE;
 END;
 /