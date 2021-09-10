/*입력받은 dDate 기준 신청 가능한 연도 계산 function Date2EnrollYear*/
CREATE OR REPLACE FUNCTION Date2EnrollYear(dDate IN DATE)
RETURN NUMBER
IS
	nYear NUMBER;
	sMonth CHAR(2);
BEGIN
	SELECT TO_NUMBER(TO_CHAR(dDate, 'YYYY')), TO_CHAR(dDate, 'MM')
	INTO nYear, sMonth
	FROM DUAL;
	
	IF (sMonth='11' or sMonth='12') THEN
		nYear:=nYear+1;
	END IF;
	
	RETURN nYear;
END;
/

/*입력받은 dDate 기준 신청 가능한 학기 계산 function Date2EnrollSemester*/
CREATE OR REPLACE FUNCTION Date2EnrollSemester(dDate IN DATE)
RETURN NUMBER
IS
	nSemester NUMBER;
	sMonth CHAR(2);
BEGIN
		SELECT TO_CHAR(dDATE, 'MM')
		INTO sMonth
		FROM DUAL;
		
		/*입력받은 달이 11, 12, 1, 2, 3, 4이면 1학기 5, 6, 7, 8, 9, 10이면 2학기*/
		IF (sMonth='11' or sMonth='12' or (sMonth>='01' and sMonth<='04')) THEN
			nSemester:=1;
		ELSE
			nSemester:=2;
		END IF;
		
		RETURN nSemester;
END;
/