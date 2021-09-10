CREATE TABLE TEACH(
	c_id VARCHAR2(10) CONSTRAINT teach_pk PRIMARY KEY ,
	p_id VARCHAR2(30) ,
	c_id_no NUMBER,
	c_name VARCHAR2(30),
	c_unit NUMBER,
	c_year NUMBER,
	c_semester NUMBER,
	c_day VARCHAR2(10),
	c_time NUMBER,
	c_where VARCHAR2(20),
	c_num NUMBER
);

CREATE TABLE ENROLL(
	s_id VARCHAR2(20),
	c_id VARCHAR2(20) CONSTRAINT enroll_pk PRIMARY KEY,
	c_id_no NUMBER,
	c_year NUMBER,
	c_semester NUMBER
);

CREATE TABLE STUDENT(
   s_id VARCHAR(10) CONSTRAINT stu_pk PRIMARY KEY,
   s_pwd VARCHAR(30),
   s_major VARCHAR(30),
   s_phone VARCHAR(15),
   s_addr VARCHAR(30),
   s_email VARCHAR(30)
);

CREATE TABLE PROFESSOR(
	p_id VARCHAR(30) CONSTRAINT prof_pk PRIMARY KEY,
	p_name VARCHAR(30),
	p_pwd VARCHAR(30)
);