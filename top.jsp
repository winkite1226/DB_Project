<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String session_id = (String) session.getAttribute("user");
String log;
if (session_id == null)
log = "<a href=login.jsp >�α���</div></a>";
else log = "<a href=logout.jsp>�α׾ƿ�</a>"; %>
    <head>   
       <meta charset="utf-8">   
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css"/>
    </head> 

<body>
<table width="75%" align="center" bgcolor="#003399" border>
<tr>
<td align="center"><b style=" color:white;"><%=log%></b></td>
<td align="center"><b><a href="update.jsp" style=" color:white;">����� ���� ����</b></td>
<td align="center"><b><a href="insert.jsp" style=" color:white;">������û �Է�</b></td>
<td align="center"><b><a href="delete.jsp" style=" color:white;">������û ����</b></td>
<td align="center"><b><a href="select.jsp" style=" color:white;">������û ��ȸ</b></td>
</tr>
</table>
</body>