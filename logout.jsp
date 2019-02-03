<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="anonymous.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>logout</title>
</head>
<body>
<%
String user = request.getParameter("va");
Chatbox.deleteOfflineUser(user);
System.out.println("logout");
%>
</body>
</html>