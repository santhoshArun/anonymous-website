<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<title>Test</title>
<style>
body {
	font-family: Comic Sans MS;
	background-color: #bbb;
}
.textdiv {
	position: fixed;
	width: 100%;
	left: 0;
	right: 0;
	bottom: 0;
	text-align: right;
	display: flex;
	z-index: 999;
	background-color: #3a3a3a;
	padding-top: 10px;
	padding-bottom: 10px;
	border-top: 4px solid #121212;
}
.texttab {
	border-collapse: separate;
	width: 76%;
	float: right;
	text-align: center;
	right: 0px;
	margin-left: 20%;
}
.emoji {
	width: 27px;
	height: 27px;
}
.emojitd {
	width: 4%;
	background-color: #fff;
	border-top-left-radius: 15px;
	border-bottom-left-radius: 15px;
	padding-left: 8px;
	padding-top: 4px;
	margin-right: 3px;
}
.textareatd {
	width: 89%;
	background-color: #fff;	
}
.sendbtntd {
	width: 7%;
	text-align: center;
	background-color: #fff;
	border-top-right-radius: 15px;
	border-bottom-right-radius: 15px;
}
.textarea {
	text-align: left;
	width: 100%;
	resize: none;
	box-sizing: border-box;
	overflow: auto;
	border: 0px;
	outline: none;
	font-size: 17px;
	font-family: Comic Sans MS;
	color: #333;
	border-top-left-radius: 15px;
	border-bottom-left-radius: 15px;
	padding-left: 20px;
	padding-top: 6px;
	padding-bottom: 2px;
	padding-right: 5px;
	margin-bottom: 5px;
}
.sendbtn {
	width: 100%;
	border: 0px;
	background-color: #fff;
	font-size: 18px;
	font-family: Comic Sans MS;
	color: #333;
	border-top-right-radius: 15px;
	border-bottom-right-radius: 15px;
	margin-left: -2px;
	margin-top: -2px;
}
header {
	position: fixed;
	color: white;
	width: 100%;
	left: 0;
	top: 0;
	z-index: 999;
	background-color: #3a3a3a;
	height: 60px;
	cursor: pointer;
	border-bottom: 4px solid #121212;
}
.headertab {
	margin-top: 0px;
	margin-left: auto;
	margin-right: auto;
	width: 100%;
	text-align: center;
	border-radius: 15px;
}
.userna {
	width: 100%;
	color: green;
	font-size: 20px;
	font-weight: bold;
	border-bottom: 4px solid #121212;
	border-right: 4px solid #121212;
	height: 60px;
}
.logo {
	font-size: 39px;
	color: #4286f4;
	font-weight: bold;
	width: 80%;
	margin-top: 20px;
}
.logout {
	width: 10%;
}
.logoutbtn {
	background-color: #ef173b;
	color: white;
	border: 0;
	padding: 7px 17px;
	font-size: 16px;
	border-radius: 5px;
}
.logoutbtn:hover {
	background-color: #c40020;
}
.chatboxdiv {
	position: fixed;
	bottom: 80px;
	right: 0px;
	width: 85%;
	height: 75%;
}
.chatboxtab {
	width: 90%;
	margin-left: auto;
	margin-right: auto;
}
.messagetd {
	background-color: #f1f1f1;
	font-size: 14px;
	width: 89%;
	text-align: right;
	padding-right: 20px;
	border-top-left-radius: 15px;
	border-bottom-left-radius: 15px;
	color: #333;
}
.sidetd {
	background-color: #f1f1f1;
	width: 11%;
	border-top-right-radius: 15px;
	border-bottom-right-radius: 15px;
}
.usernametd {
	font-size: 10px;
	color: green;
}
.timetd {
	font-size: 8px;
	color: blue;
}
.navi {
	top: 0px;
	position: fixed;
	background-color: #3a3a3a;
	width: 15%;
	left: 0;
	height: 100%;
	color: #4286f4;
	z-index: 1100;
	cursor: pointer;
	border-right: 4px solid #121212;
	border-bottom: 4px solid #121212;
}
.onlinetab {
	margin-left: 20px;
}
.onlinetd {
	font-size: 17px;
	font-weight: bold;
	padding-top: 6px;
}
.emojitab {
	display: none;
	position: fixed;
	bottom: 60px;
	padding: 5px;
	margin-left: -7px;
	background-color: #f2f2f2;
	border-radius: 14px;
	border: 5px solid #f2f2f2;
	height: 300px;
	overflow-y: scroll;
}
.emojiheader {
	margin-right: 2px;
	margin-bottom: -5px;
}
.online {
	margin-left: 20px;
}
.useame {
	width: 16%;
}
.username {
	padding-top: 15px;
	text-align: center;
}
</style>
</head>
<body>
	
	<!-- header part -->
	<header>
		<table class="headertab">
			<tr>
				<td id="usr" class="useame">&emsp;</td>
				<td class="logo">Gothhaaa... its our fuckin' ChatBox</td>
				<td class="logout"><button class="logoutbtn" onClick="logout()">logout</button></td>
			</tr>
		</table>
	</header>
	
	<!-- textarea box and send button -->
	<div class="textdiv">
		<table class="texttab">
			<tr class="texttr">
				<td class="emojitd">
					<div class="emojiheader">
						<img src="line/a (1).svg" class="emoji" id="tray">
					</div>
					<div class="emojitab" id="emojitray">
						<table>
							<tr>
							<%for(int i = 1; i < 788; i++) 
								{
							%>
								<td><img src="line/a (<%out.print(i); %>).svg" class="emoji" onClick="emojiclick(this.src)"></td>
									<%if(i%8==0) {
										%></tr><tr><%
									}
								} %>
							</tr>
						</table>
					</div>
				</td>
				<td class="textareatd"><div contentEditable="true" class="textarea" id="textarea"></div></td>
				<td class="sendbtntd"><button class="sendbtn" id="sendbtn" onClick="sendbtn()">send</button></td>
			</tr>
		</table>
	</div>
	
	<!-- chat page -->
	<div class="chatboxdiv" id="chatboxdiv">
		<table class="chatboxtab" id="chatboxtab">
			<!-- ajax call occurs here -->
		</table>
	</div>
	
	<nav class="navi">
		<div class="userna">
			<div id="user" class="username">
			</div>
		</div>
		<h2 class="online">fuckers online </h2>
		<div class="onlinestat" id="stat">
			<!-- show online status by ajax request -->
		</div>
	</nav>
	
	<script>
	
		$("#tray").click(function(){
			$("#emojitray").show(500);
		});
		
		$(document).mouseup(function(e) 
		{
		    var container = $("#emojitray");

		    // if the target of the click isn't the container nor a descendant of the container
		    if (!container.is(e.target) && container.has(e.target).length === 0) 
		    {
		        container.hide();
		    }
		});
		
		function logout() {
			var username= localStorage.getItem("uname");
			var ajaxRequest = new XMLHttpRequest();
			ajaxRequest.open("GET", "http://f165a242.ngrok.io/anonymous/logout.jsp?va=" + username, true);
		    ajaxRequest.send(null);
		    localStorage.clear();
		    window.location="http://f165a242.ngrok.io/anonymous/index.html";
		}
	
		function emojiclick(source) {
			document.getElementById("textarea").innerHTML = document.getElementById("textarea").innerHTML 
			+ '<img style="width: 22px; height: 22px;margin-bottom: -4px;" src="' + source + '">';
		}
	
		//show username onload
		window.onload = function() {
			{
				var username= localStorage.getItem("uname");
				$("#textarea").focus();
				var ajaxRequest = new XMLHttpRequest();
				ajaxRequest.onreadystatechange = function() {
			        if(ajaxRequest.readyState == 4) {
			           var ajaxDisplay = document.getElementById("user");
			           ajaxDisplay.innerHTML = ajaxRequest.responseText;
			        }
			     }
				ajaxRequest.open("GET", "http://f165a242.ngrok.io/anonymous/username.jsp?va=" + username, true);
			    ajaxRequest.send(null);
			}
			var i = 0;
			setInterval(function() {
				(function showUp(){
					
					var ajaxRequest = new XMLHttpRequest();
					ajaxRequest.onreadystatechange = function() {
				        if(ajaxRequest.readyState == 4) {
				           var ajaxDisplay = document.getElementById("chatboxtab");
				           ajaxDisplay.innerHTML = ajaxRequest.responseText;
				        }
				     }
					ajaxRequest.open("GET", "http://f165a242.ngrok.io/anonymous/repeat.jsp", true);
				    ajaxRequest.send(null);
				})()
			}, 3000);
			
			//online user
			setInterval(function() {
				(function showDown(){
					if(window.navigator.onLine) {
						var username= localStorage.getItem("uname");
						
						ajaxRequest.onreadystatechange = function() {
					        if(ajaxRequest.readyState == 4) {
					           var ajaxDisplay = document.getElementById("stat");
					           ajaxDisplay.innerHTML = ajaxRequest.responseText;
					        }
					     }
						ajaxRequest.open("GET", "http://f165a242.ngrok.io/anonymous/online.jsp?va=" + username, true);
					    ajaxRequest.send(null);
					    
					}
				})()
			}, 5000);
			
			//refresh list
			setInterval(function() {
				(function showDown(){
					ajaxRequest.onreadystatechange = function() {
				        if(ajaxRequest.readyState == 4) {
				           var ajaxDisplay = document.getElementById("stat");
				           ajaxDisplay.innerHTML = ajaxRequest.responseText;
				        }
				     }
					ajaxRequest.open("GET", "http://f165a242.ngrok.io/anonymous/refresh.jsp", true);
				    ajaxRequest.send(null);
					
				})()
			}, 60000);
		}
		
		//offline user
		 window.onbeforeunload = closingCode;
	    function closingCode(){
	       // do something...
	       var username= localStorage.getItem("uname");
	       var ajaxRequest = new XMLHttpRequest();
	       
			ajaxRequest.open("GET", "http://f165a242.ngrok.io/anonymous/offline.jsp?va=" + username, true);
		    ajaxRequest.send(null);
	       return false;
	    }
		//send message to show
		function sendbtn() {
			var message = document.getElementById("textarea").innerHTML;
			if(message != "") {
				var username= localStorage.getItem("uname");
				var uriMessage = encodeURI(message);
				var ajaxRequest = new XMLHttpRequest();
				ajaxRequest.onreadystatechange = function() {
			        if(ajaxRequest.readyState == 4) {
			           var ajaxDisplay = document.getElementById("chatboxtab");
			           ajaxDisplay.innerHTML = ajaxRequest.responseText;
			        }
			     }
				var i = 0;
				ajaxRequest.open("GET", "http://f165a242.ngrok.io/anonymous/post.jsp?va=" + username + "&vb=" + uriMessage, true);
			    ajaxRequest.send(null);
			    document.getElementById("textarea").innerHTML = "";
			    
			}
			
		}
		//auto resize textarea
		$(document).find('textarea').each(function () {
			var offset = this.offsetHeight - this.clientHeight;
			$(this).on('keyup input focus', function () {
				$(this).css('height', 'auto').css('height', this.scrollHeight + offset);
			});
		});
		
		//setting enter key as post button
		$(document).ready(function() {
				$("#textarea").keypress(function(e) {
					var key = e.which;
					if(key == 13  && !e.shiftKey) {
						$("#sendbtn").click();
						return false;
					}
			});
		});
		
	</script>
</body>
</html>