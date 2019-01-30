<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<meta charset="ISO-8859-1">
<title>Test</title>
<style>

</style>
</head>
<body>
	
<input type="checkbox" id="checkAll" onClick="ch()"> Check All
sdl;
<table></table>
    <div>
    <input type="checkbox" id="checkItem"> Item 1
    <input type="checkbox" id="checkItem"> Item 2 
    <input type="checkbox" id="checkItem"> Item3
    </div>
    <script>
    $('#checkAll').click(function () {    
    	window.alert('sdf');
        $('input:checkbox').prop('checked', this.checked);    
    });
    </script>
</body>
</html>