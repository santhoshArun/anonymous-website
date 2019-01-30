<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<title>fun chat</title>
<style>
	body {
		font-family: Comic Sans MS;
		background-color: #9c93ff;
	}
	
	#chatbox {
		margin-bottom: 10px;
		width: 100%;
	}
	#chatcell {
		margin: 6px;
		padding: 4px;
	}
	#row,#col1,#col2 {
		color: #ffffff;
	}
	#row {
		border-top-left-radius: 6px;
		border-bottom-left-radius: 6px;
		padding-left: 14px;
		padding-right: 14px;
		padding-top: 5px;
		padding-bottom: 5px;
		font-weight: bold;
	}
	#col1,#col2 {
		text-align: center;
		font-weight: bold;
	}
	#col1 {
		font-size: 14px;
	}
	#col2 {
		font-size: 10px;
	}
	#rightrow {
		border-top-right-radius: 6px;
		border-bottom-right-radius: 6px;
	}
	#messagetable {
		border-spacing: 2px 2px;
		box-sizing: border-box;
		width: 99%;
		margin: 5px;
		padding: 1px;
	}
	#line {
		background-color: #6f83e8;
	}
	textarea {
		height: auto;
		resize: none;
		box-sizing: border-box;
		font-family: Comic Sans MS;
		width: 100%;
		padding-left: 15px;
		padding-right: 15px;
		padding-top: 6px;
		padding-bottom: 6px;
		border-radius: 8px;
		background-color: #f0f0f0;
		border: 0;
		font-size: 16px;
	}
	button {
		width: 100%;
		font-family: Comic Sans MS;
		border-radius: 8px;
		border: 0;
		font-size: 16px;
		padding-left: 12px;
		padding-right: 12px;
		padding-top: 5px;
		padding-bottom: 7px;
		background-color: #5e53e2;
		color: #ffffff;
		font-weight: bold;
	}
	button:hover {
		width: 100%;
		font-family: Comic Sans MS;
		border-radius: 8px;
		border: 0;
		font-size: 16px;
		padding-left: 12px;
		padding-right: 12px;
		padding-top: 5px;
		padding-bottom: 7px;
		background-color: #362dad;
		color: #ffffff;
		font-weight: bold;
	}
</style>
</head>
<body>

	<table id="chatbox">
		<tr>
			<td id="chatcell"><textarea rows="1" cols="80" style="overflow:hidden"></textarea></td>
			<td id="chatcell"><button>post</button></td>
		</tr>
	</table>
	
	<table id="messagetable">
		
	</table>
	<p></p>
	<script>
	//textarea auto resize
	var textarea = document.querySelector('textarea');
	textarea.addEventListener('keydown', autosize);
	function autosize(){
	  var el = this;
	  setTimeout(function(){
	    el.style.cssText = 'height:auto; padding:6px; overflow:hidden';
	    // for box-sizing other than "content-box" use:
	    // el.style.cssText = '-moz-box-sizing:content-box';
	    el.style.cssText = 'overflow:hidden; height:' + el.scrollHeight + 'px';
	  },0);
	}
	
	//setting enter key as post button
	$(document).ready(function() {
			$("textarea").keypress(function(e) {
				var key = e.which;
				if(key == 13) {
					$("button").click();
					return false;
				}
		});
	});
	
	//posting message and make text area empty
	$(document).ready(function() {
			$("button").click(function() {
				var user = "santhosh";
				var date = "24/9/18";
				var msg = $("textarea").val();
				if(msg != "") {
					var table = "<tr id=\"line\"><td width=\"90%\" id=\"row\">" + msg + "</td><td width=\"10%\" id=\"rightrow\"><table width=\"100%\"><tr><td id=\"col1\">" + user + "</td></tr><tr><td id=\"col2\">" + date + "</td></tr></table></td></tr>";
					$("#messagetable").prepend(table);
					$("textarea").text("");
					$("textarea").val("");
				}
			});
	});
	</script>
	
</body>
</html>