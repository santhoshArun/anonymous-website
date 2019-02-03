<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="anonymous.*"%>
<%
String username = request.getParameter("va");
//String ip = Register.getIP();
String ipAddress = request.getHeader("X-FORWARDED-FOR");  
if (ipAddress == null) {  
  ipAddress = request.getRemoteAddr();  
}
int status = Register.registerUser(username, ipAddress);
out.print(status);
%>