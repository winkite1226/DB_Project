<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head><title> ������û �Է� </title></head>
<body>
<%   
   request.setCharacterEncoding("UTF-8");

   String stu_id = (String)session.getAttribute("user");
   String course_id = request.getParameter("c_id");
   int course_id_no = Integer.parseInt(request.getParameter("c_id_no"));
   
   Connection myConn = null;       
   String result = null;
   String dburl  = "jdbc:oracle:thin:@localhost:1521:orcl";
   String user="DB09";
   String passwd="SS22019";
   String dbdriver = "oracle.jdbc.driver.OracleDriver";
   try {
         Class.forName(dbdriver);
         myConn =  DriverManager.getConnection(dburl, user, passwd);
    } catch(SQLException ex) {
        System.err.println("SQLException: " + ex.getMessage());   
   }
   CallableStatement cstmt = myConn.prepareCall("{call InsertEnroll(?,?,?,?)}");
   cstmt.setString(1, stu_id);
   cstmt.setString(2, course_id);
   cstmt.setInt(3, course_id_no);
   cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);  
   
   try {     
      cstmt.execute();
      result = cstmt.getString(4);
%>
		<script>
      		alert("<%= result %>");
      		location.href="insert.jsp";   
		</script>
	<% 
	  } catch(SQLException ex) {      
       System.err.println("SQLException: " + ex.getMessage());  
      }  
       finally {
       	if (cstmt != null) 
          	  try { 
             	  myConn.commit(); 
               	  cstmt.close();  
               	  myConn.close(); 
              }
         	  catch(SQLException ex) { }
        }
%>
</body></html>