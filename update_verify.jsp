<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������û ����� ���� ����</title>
</head>
<body>
<%
	String dburl="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="DB09";
	String passwd="SS22019";
	String dbdriver="oracle.jdbc.driver.OracleDriver";

	String s_id=request.getParameter("s_id");
	String s_pwd=request.getParameter("s_pwd");
	String s_addr=request.getParameter("s_addr");
	String s_phone=request.getParameter("s_phone");
	String s_email=request.getParameter("s_email");
	
	Connection myConn=null; Statement stmt=null; String mySQL="";
	
	
	try{
		Class.forName(dbdriver);
		myConn=DriverManager.getConnection(dburl, user, passwd);
		stmt=myConn.createStatement();
	}catch(SQLException ex){
		System.err.println("SQLException:"+ex.getMessage());
	}
	
	mySQL="UPDATE student";
	mySQL=mySQL+" SET s_addr='"+s_addr+"', s_phone='"+s_phone+"', s_email='"+s_email+"', s_pwd='"+s_pwd+"' where s_id='"+s_id+"'";
	try{
		stmt.executeQuery(mySQL);
%>
	<script>
		alert("�л� ������ �����Ǿ����ϴ�.");
		location.href="update.jsp";
	</script>
	<%
	}catch(SQLException ex){
		String sMessage;
		if(ex.getErrorCode()==20002)
			sMessage="��ȣ�� 4�ڸ� �̻��̾�� �մϴ�.";
		else if(ex.getErrorCode()==20003)
			sMessage="��ȣ�� ������ �Էµ��� �ʽ��ϴ�.";
		else 
			sMessage="��� �� �ٽ� �õ��Ͻʽÿ�.";
	%>
	<script>
		alert("<%=sMessage%>");
		location.href="update.jsp";
	</script>
	<%
	}finally{
		if(stmt!=null)
			try{
				stmt.close();
				myConn.close();
			}catch(SQLException ex){
			}
	}
	%>		
</body>
</html>