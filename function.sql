/*�Է¹��� dDate ���� ��û ������ ���� ��� function Date2EnrollYear*/
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

/*�Է¹��� dDate ���� ��û ������ �б� ��� function Date2EnrollSemester*/
CREATE OR REPLACE FUNCTION Date2EnrollSemester(dDate IN DATE)
RETURN NUMBER
IS
	nSemester NUMBER;
	sMonth CHAR(2);
BEGIN
		SELECT TO_CHAR(dDATE, 'MM')
		INTO sMonth
		FROM DUAL;
		
		/*�Է¹��� ���� 11, 12, 1, 2, 3, 4�̸� 1�б� 5, 6, 7, 8, 9, 10�̸� 2�б�*/
		IF (sMonth='11' or sMonth='12' or (sMonth>='01' and sMonth<='04')) THEN
			nSemester:=1;
		ELSE
			nSemester:=2;
		END IF;
		
		RETURN nSemester;
END;
/