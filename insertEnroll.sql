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
	DBMS_OUTPUT.PUT_LINE(sStudentId||' ���� �����ȣ '||sCourseId||', �й� '||TO_CHAR(nCourseIdNo)||'�� ���� ����� ��û�Ͽ����ϴ�.');
	/*��û�� �� ���� ��û ������ ������ �б� ���*/
	nYear:=Date2EnrollYear(SYSDATE);
	nSemester:=Date2EnrollSemester(SYSDATE);
	
	/*���� ó��1 : �ִ����� �ʰ�*/ 
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
	
	/*���� ó��2 : ������ ���� ��û ����*/
	SELECT COUNT(*)
	INTO nCnt
	FROM enroll
	WHERE s_id=sStudentId and c_id=sCourseId;
	
	IF (nCnt>0) THEN
		RAISE too_many_courses;
	END IF;
	
	/*���� ó��3 : ������û �ο� �ʰ� ����*/
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
	
	/*���� ó��4 : ��û�� ����� �ð� �ߺ� ����*/
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
	
 	/* ���� ��û ��� */
 	INSERT INTO enroll(s_id, c_id, c_id_no, c_year, c_semester) VALUES (sStudentId, sCourseId, nCourseIdNo, nYear, nSemester);
	COMMIT;
 	result := '������û ����� �Ϸ�Ǿ����ϴ�.';
 	
 	EXCEPTION
 		WHEN too_many_sumCourseUnit THEN
 			result := '�ִ������� �ʰ��Ͽ����ϴ�';
 		WHEN too_many_courses THEN
 			result := '�̹� ��ϵ� ������ ��û�Ͽ����ϴ�';
 		WHEN too_many_students THEN
 			result := '������û �ο��� �ʰ��Ǿ� ����� �Ұ����մϴ�';
 		WHEN duplicate_time THEN
 			result := '�̹� ��ϵ� ���� �� �ߺ��Ǵ� �ð��� �����մϴ�';
 		WHEN OTHERS THEN
 			ROLLBACK;
 			result := SQLCODE;
 END;
 /