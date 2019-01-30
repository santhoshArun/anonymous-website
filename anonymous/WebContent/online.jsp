<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="anonymous.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String user = request.getParameter("va");
Chatbox.insertOnlineUser(user);
String[] onlineUsers = Chatbox.getOnlineUsers();
int count = Chatbox.getOnlineUsersCount();
%><table class="onlinetab"><%
for(int i = 0; i < count; i++) {
	%>
	<tr><td class="onlinetd"><%out.print(onlineUsers[i]); %></td></tr>
	
	<%
}
%> 
</table>
</body>
</html>