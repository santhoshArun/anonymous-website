<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>connecter</title>
</head>
<body>
<%
	Connection connection = null;
	
	try {
		Class.forName("org.postgresql.Driver");  
		connection = DriverManager.getConnection("jdbc:postgresql://localhost:5433/funchat", "postgres", "ch3coona");
		out.print("connected");
	} catch(Exception e) {
		out.print(e);
	}
%>
</body>
</html>