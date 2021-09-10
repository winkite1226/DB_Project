<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*"  %>
<html>
<head> <title>수강신청 확인</title> </head>
<body>
<%@ include file="top.jsp" %>         
<%   if (session_id==null) 
   response.sendRedirect("login.jsp");  %>
<table width="75%" border="1" cellspacing="0" cellpadding="3" align="center">
<br>
<tr><th>과목번호</th><th>분반</th><th>학기</th><th>과목명</th><th>강의시간</th><th>학점</th><th>장소</th></tr>
<%   
   Connection myConn = null; 
   Statement stmt = null;
   Statement cstmt = null;
   ResultSet myResultSet = null; 
   ResultSet sub_set = null;
   String mySQL = "";
   String sub_sql="";
   String course_name= "";
   int course_unit=0;
   int course_year=0;
   int course_semester=0;
   String course_day= "";
   int course_time=0;
   String course_where= "";
   String course_id= "";
   int course_id_no=0;
   
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
   mySQL = "select c_id, c_id_no from enroll where s_id='" + session_id +"'";
   myResultSet = stmt.executeQuery(mySQL);      //SQL문 적용
   
   if (myResultSet != null) {
      while (myResultSet.next()) {   //사용자가 수강 신청하지 않은 과목 목록을 DB에서 가져옴 
         course_id = myResultSet.getString("c_id");
         course_id_no = myResultSet.getInt("c_id_no");
         try{
        	 cstmt = myConn.createStatement();
         } catch(SQLException ex){
        	 System.err.println("SQLException: " + ex.getMessage());
         }
         sub_sql = "select c_name, c_unit, c_year, c_semester, c_day, c_time, c_where from teach where c_id='"+course_id+"' and c_id_no='"+course_id_no+"'";
         sub_set = cstmt.executeQuery(sub_sql);
         if(sub_set != null){
        	 while(sub_set.next()){
        		 course_name=sub_set.getString("c_name");
            	 course_unit=sub_set.getInt("c_unit");
            	 course_year=sub_set.getInt("c_year");
            	 course_semester=sub_set.getInt("c_semester");
            	 course_day=sub_set.getString("c_day");
            	 course_time=sub_set.getInt("c_time");
            	 course_where=sub_set.getString("c_where");
            	 %>
            	 <tr>            
            	   <td align="center"><%= course_id %></td>
            	   <td align="center"><%= course_id_no %></td>
            	   <td align="center"><%= course_year %>-<%= course_semester %></td> 
            	   <td align="center"><%= course_name %></td> 
            	   <td align="center"><%= course_day %> <%= course_time %>시-<%= course_time+1 %>시</td> 
            	   <td align="center"><%= course_unit %></td> 
            	   <td align="center"><%= course_where %></td>
            	 </tr>
            	 <%
        	 }
         }
         }
     }
   stmt.close(); 
   myConn.close();
%>
</table> </body> </html>