<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수강신청 입력</title>
</head>
<body>
<%@ include file="top.jsp" %>
<%	if (session_id==null) response.sendRedirect("login.jsp");  %>
<%	
	Connection myConn = null; 
	Statement stmt = null;
	String mySQL = null;

	String dburl  = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user="DB09";
	String passwd="SS22019";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";    
	try {
		Class.forName(dbdriver);
	    	myConn =  DriverManager.getConnection (dburl, user, passwd);
		stmt = myConn.createStatement();
    } catch(SQLException ex) {
	     System.err.println("SQLException: " + ex.getMessage());
	}
	mySQL = "select * from (select t.c_id, t.c_year, t.c_semester, t.c_id_no, t.c_name, t.c_unit, t.c_day, t.c_time, t.c_where, p.p_name from professor p, teach t where t.p_id=p.p_id and t.c_id not in (select c_id from enroll where s_id='" + session_id + "')) order by c_year desc, c_semester desc";
	
	try{
		ResultSet myResultSet = stmt.executeQuery(mySQL);	
		%>
		<table width="75%" border="1" cellspacing="0" cellpadding="3" align="center">
		<br>
		<tr><th>과목번호</th><th>학기</th><th>분반</th><th>과목명</th><th>학점</th><th>수업시간</th><th>장소</th><th>담당교수</th><th>수강신청</th></tr>
		<%
		if (myResultSet != null) {
			while (myResultSet.next()) {
				String c_id = myResultSet.getString("c_id");
				String c_year = myResultSet.getString("c_year");
				String c_semester = myResultSet.getString("c_semester");
				int c_id_no = myResultSet.getInt("c_id_no");
				String c_name = myResultSet.getString("c_name");
				int c_unit = myResultSet.getInt("c_unit");	
				String c_day = myResultSet.getString("c_day");
				int c_time = myResultSet.getInt("c_time");
				String c_where=myResultSet.getString("c_where");
				String c_prof = myResultSet.getString("p_name");
	%>
	<tr>
  		<td align="center"><%= c_id %></td>
  		<td align="center"><%= c_year %>-<%= c_semester %></td>
  		<td align="center"><%= c_id_no %></td> 
  		<td align="center"><%= c_name %></td>
  		<td align="center"><%= c_unit %></td>
  		<td align="center"><%= c_day %> <%= c_time %>시-<%= c_time+1 %>시</td>
  		<td align="center"><%= c_where %></td>
  		<td align="center"><%= c_prof %></td>
  		<td align="center"><a href="insert_verify.jsp?c_id=<%= c_id %>&c_id_no=<%= c_id_no %>">신청</a></td>
	</tr>
		   
	<%
			} 
		}
	}catch(SQLException e){
		out.println(e);
		e.printStackTrace();
	}
	stmt.close(); 
	myConn.close();
%>
</table>
</body>
</html>