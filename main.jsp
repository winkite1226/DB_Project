<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head> <meta charset="UTF-8">
<title>�����ͺ��̽��� Ȱ���� ������û �ý����Դϴ�.</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css"/>
 </head>
<body bgcolor="#F6F6F6">
<%@ include file="top.jsp" %>

<table width="75%" align="center" height="100%">
<% if (session_id != null) { %>
<tr> <td align="center"><%=session_id%>�� �湮�� ȯ���մϴ�.</td> </tr>
<% } else { %>
<tr> <td align="center">�α����� �� ����ϼ���.</td> </tr>
<% } %>

</table> </body> </html>