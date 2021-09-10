INSERT INTO TEACH VALUES('C800', 'dbp1234', 1, '데이터베이스 프로그래밍', 3, 2019, 1, '월수', 13, '명신관 315', 30);
INSERT INTO TEACH VALUES('C900', 'werqcff77', 3, '인공지능', 3, 2018, 2, '화목', 10, '진리관 501', 50);
INSERT INTO TEACH VALUES('M100', 'vbmrb', 2, '데이터사이언스 개론', 3, 2019, 1, '월수', 12, '명신관 415', 25);
INSERT INTO TEACH VALUES('M200', 'yuiov79', 1, '선형대수', 3, 2019, 1, '화목', 14, '명신관 602', 40);
INSERT INTO TEACH VALUES('M300', 'dbp1234', 2, '그래픽 활용', 3, 2019, 1, '월수', 15, '프라임관 106', 35);
INSERT INTO TEACH VALUES('M400', 'abcde7594', 2, '윈도우즈 프로그래밍', 3, 2019, 1, '월수', 12, '순헌관 501', 20);
INSERT INTO TEACH VALUES('M500', 'dbp1234', 1, '컴퓨터 그래픽스', 3, 2018, 1, '화목', 10, '순헌관 206', 20);
INSERT INTO TEACH VALUES('M600', 'tbckeh20', 1, '자바 프로그래밍', 3, 2019, 1, '화목', 13, '진리관 308', 30);
INSERT INTO TEACH VALUES('M700', 'tcebz11', 3, '리눅스 프로그래밍', 3, 2019, 1, '월수', 16, '명신관 512', 40);
INSERT INTO TEACH VALUES('A900', 'tbckeh20', 2, '모바일 프로그래밍', 3, 2019, 2, '월수', 12, '명신관 201', 30);
INSERT INTO TEACH VALUES('A100', 'abcde7594', 1, '데이터베이스 설계와 질의', 3, 2019, 2, '화목', 10, '명신관 401', 30);
INSERT INTO TEACH VALUES('A200', 'dbp1234', 1, '데이터마이닝', 3, 2019, 2, '월수', 15, '명신관 201', 30);
INSERT INTO TEACH VALUES('A300', 'tbckeh20', 2, '시스템 프로그래밍', 3, 2019, 2, '화목', 10, '순헌관 303', 30);
INSERT INTO TEACH VALUES('A400', 'yuiov79', 1, '소프트웨어의 이해', 3, 2019, 2, '월수', 11, '명신관 303', 30);
INSERT INTO TEACH VALUES('A500', 'dbp1234', 3, '컴퓨터과학의 이해', 3, 2019, 2, '금', 12, '진리관 405', 30);

INSERT INTO ENROLL(s_id, c_id, c_id_no, c_year, c_semester) VALUES('1615407', 'C800', 1, 2019, 1);

INSERT INTO professor(p_id, p_name, p_pwd) VALUES ('dbp1234', '심준호', 'dkgb45678');
INSERT INTO professor(p_id, p_name, p_pwd) VALUES ('gkfjeb45', '유석종', 'dkcb5578');
INSERT INTO professor(p_id, p_name, p_pwd) VALUES ('abcde7594', '이광수', 'sbckd45');
INSERT INTO professor(p_id, p_name, p_pwd) VALUES ('asdf8552', '이현자', 'dfsfbg5');
INSERT INTO professor(p_id, p_name, p_pwd) VALUES ('tbckeh20', '박숙영', 'tbchx25');
INSERT INTO professor(p_id, p_name, p_pwd) VALUES ('werqcff77', '채희준', 'zxcv27');
INSERT INTO professor(p_id, p_name, p_pwd) VALUES ('yuiov79', '김윤진', 'gkcbeb5');
INSERT INTO professor(p_id, p_name, p_pwd) VALUES ('tcebz11', '창병모', 'zhdbg');
INSERT INTO professor(p_id, p_name, p_pwd) VALUES ('vbmrb', '이기용', '9871');

INSERT INTO STUDENT VALUES('1615407', 'lostname33!', '컴퓨터과학과', '01063409823', '경기도 평택시 합정동', 'winkite1226@naver.com');
INSERT INTO STUDENT VALUES('1610591','ss0591', '통계학과', '01027999928', '경기도 용인시 기흥구', 'ksg97928@naver.com');
INSERT INTO STUDENT VALUES('1513949','mink','컴퓨터과학과','01092271795','경기도 광명시','mk1795@naver.com');