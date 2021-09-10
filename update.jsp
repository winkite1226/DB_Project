<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head> <meta charset="UTF-8"> <title>수강신청 사용자 정보 수정</title> </head>
<body>
<%@include file ="top.jsp" %>
<% 
   if (session_id==null) 
      response.sendRedirect("login.jsp");

   String studentID = session_id;
   Connection myConn = null;
   Statement stmt = null;
   String mySQL = null;
   
   String dburl = "jdbc:oracle:thin:@localhost:1521:orcl";
   String user ="DB09";
   String passwd ="SS22019";
   
   String dbdriver = "oracle.jdbc.driver.OracleDriver";
   Class.forName(dbdriver);
   myConn = DriverManager.getConnection(dburl, user, passwd);
   stmt = myConn.createStatement();
   
   mySQL = "select s_pwd, s_major, s_email,s_phone,s_addr from student where s_id='" + session_id + "'" ;
   ResultSet myResultSet = stmt.executeQuery(mySQL);
%>
   <form method="post" action="update_verify.jsp">
    <table width="75%" border="1" cellspacing="0" cellpadding="3"  align="center">

    <tr> 
      <td colspan="2" height="39" align="center">
         <font size="+1" ><b>학생 정보 수정</b></font></td>
    </tr>

    <tr> 
      <td  width="200" align="center"> 사용자 ID </td>
      <td  width="400"><%=studentID%><sup><font size="2" color="red">&nbsp;*사용자 아이디는 학번으로 수정불가</font></sup></td>
    </tr>
    
 <%
   while(myResultSet.next() != false){ 
      String s_pwd = myResultSet.getString("s_pwd");
      String s_major = myResultSet.getString("s_major");
      String s_addr = myResultSet.getString("s_addr");
      String s_email = myResultSet.getString("s_email");
      String s_phone = myResultSet.getString("s_phone");%>
      <input type="hidden" name="s_id" size="15" value="<%= studentID %>">
      <tr>
         <td width="200" align="center">전공</td>
         <td width="400"><input type="text" name="s_name" size="15" value="<%=s_major%>"></td>
      </tr>
      <tr> 
            <td width="200" align="center">비밀번호</td>
            <td width="400"><input type="password" name="s_pwd" size="15" value="<%=s_pwd%>"></td>
      </tr>
      <tr>
         <td width="200" align="center">주소</td>
         <td width="400"><input type="text" name="s_addr" size="50" value="<%=s_addr%>"></td>
      </tr>
      <tr>
         <td width="200" align="center">E-mail</td>
         <td width="400"><input type="text" name="s_email" size="50"   value="<%=s_email%>"></td>
      </tr>
      <tr>
         <td width="200" align="center">연락처</td>
         <td width="400"><input type="text" name="s_phone" size="50"   value="<%=s_phone%>"></td>
      </tr> 
       <% } %>
         <tr> 
      <td colspan="2" align="center"> 
       <input type="submit" name="modify" value="수   정" >
       <input type="button" value="취  소" onclick="javascript:window.location='main.jsp'">      
      </td>
    </tr>
</table>
</form>


</body>
</html>