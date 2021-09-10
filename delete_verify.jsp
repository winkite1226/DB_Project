<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>수강신청 취소</title>
</head>
<body>
<%
	Connection myConn = null;    String	result = null;	
	String dburl  = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user="DB09";   String passwd="SS22019";
	String dbdriver = "oracle.jdbc.driver.OracleDriver";    
	Statement stmt=null;
	String mySQL="";
	String r_mySQL="";
	String stu_id = (String)session.getAttribute("user");
	String course_id = request.getParameter("c_id");
	int course_id_no = Integer.parseInt(request.getParameter("c_id_no"));
	   
	try {
		Class.forName(dbdriver);
	    myConn =  DriverManager.getConnection (dburl, user, passwd);
	    stmt = myConn.createStatement();
	} catch(SQLException ex) {
    	 System.err.println("SQLException: " + ex.getMessage());
	}
	mySQL="delete from enroll where c_id='"+course_id+"' and c_id_no='"+course_id_no+"' and s_id='"+stu_id+"'";
	r_mySQL="commit";
	try{
		stmt.executeQuery(mySQL);
		stmt.executeQuery(r_mySQL);
	}catch(SQLException ex){
		System.err.println("SQLException: " + ex.getMessage());
	}
	finally{
%>		
		<script>
			alert("해당 과목의 수강신청이 취소되었습니다.");
			location.href="delete.jsp";
		</script>
<%		
		stmt.close();
		myConn.close();
	}
%>
</form>
</body>
</html>