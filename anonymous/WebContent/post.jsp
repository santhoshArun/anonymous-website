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
String username = request.getParameter("va");
String message = request.getParameter("vb");
Chatbox.insertMessage(username, message);

String[] users = Chatbox.getUsername();
String[] mess = Chatbox.getMessage();
String[] time = Chatbox.getTime();
int count = Chatbox.getmcount();

for(int i = 0; i < count; i++) {
	
%>

	<tr>
		<td class="messagetd"><%out.print(mess[i]); %></td>
		<td class="sidetd">
			<table>
				<tr>
					<td class="usernametd"><%out.print(users[i]); %></td>
				</tr>
				<tr>
					<td class="timetd"><%out.print(time[i]); %></td>
				</tr>
			</table>
		</td>
	</tr>

<%
}
%>

</body>
</html>