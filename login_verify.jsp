<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%	
	String userID = request.getParameter("userID");		           
  	String userPassword = request.getParameter("userPassword");     
	Connection myConn = null;
  	Statement stmt = null;	
  	String mySQL = null;
  	String dburl  = "jdbc:oracle:thin:@localhost:1521:orcl";
  	String user="DB09";
  	String passwd="SS22019";					  
  	String dbdriver = "oracle.jdbc.driver.OracleDriver";
  	Class.forName(dbdriver);
  	myConn =  DriverManager.getConnection(dburl, user, passwd);
  	
  	stmt = myConn.createStatement();	
  	mySQL = "select s_id from student where s_id='" + userID + "' and s_pwd='" + userPassword + "'";			
  	ResultSet myResultSet = stmt.executeQuery(mySQL);
  	if (myResultSet.next()) {
		session.putValue("user", userID);
      	response.sendRedirect("main.jsp");
  	} else {			
%>
<script>
	alert("����ھ��̵� Ȥ�� ��ȣ�� Ʋ�Ƚ��ϴ�");	
    	location.href = "login.jsp";			  
</script>
<%	}	stmt.close();
  		myConn.close();	%>
  	