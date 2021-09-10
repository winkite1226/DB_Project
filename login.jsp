<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> <meta charset="UTF-8"> <title>수강신청 시스템 로그인</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css"/>
 </head>
 <style> 
 
 #login{
width:200px; height:100px; position:fixed; top:30%; left:50%; margin-left:-100px; margin-top:-50px; padding:0px;

}

 #reset{
width:100px; height:50px; position:absolute; top:80%; left:50%; margin-left:-30px; margin-top:-25px; padding:0px;

}
 
 </style>
 
<body bgcolor="#F6F6F6">

<form method="post" action="login_verify.jsp">
<font color="#003399" ><h1><p id= "login"  style="font-size:48pt;">LOGIN </p></h1></font>
<div><input type="text" name="userID" placeholder="아이디"style="width:400px; height:46px; position:absolute; top:40%; left:50%; margin-left:-200px; margin-top:-23px; padding:0px;"></div>
 
<div><input type="password" name="userPassword" placeholder="패스워드" style="width:400px; height:46px; position:absolute; top:52%; left:50%; margin-left:-200px; margin-top:-23px; padding:0px;"></div>

<div><INPUT TYPE="SUBMIT" NAME="Submit" VALUE="로그인" style="background-color:#003399; font-size:12pt; color:white;
 width:400px; height:60px; position:absolute; top:60%; left:50%; margin-left:-200px; margin-top:-30spx; padding:0px;"></div>

 <font color="#003399" ><a href="javascript:window.location='main.jsp'" id="reset" >뒤로가기</a></font>

</form>


</body>
</html>