<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<title>Connection</title>

<style type="text/css">
#source {
	float: left;
	width: 450px;
	padding: 10px;
	 border: 2px solid black;
}

#destination {
	float: right;
	width: 450px;
	padding: 10px;
	 border: 2px solid black;
}
span.error {
	color: red;
	margin-left: 10px;
}

form label {
  display: inline-block;
  width: 100px;
}
 
form div {
  margin-bottom: 10px;
}
 
.error {
  color: red;
  margin-left: 5px;
}
 
label.error {
  display: inline;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	  $('#sourceTable').submit(function(e) {
	    e.preventDefault();
	    var count=0;
	    var driverName = $('#driverName').val();
	    var connectionURL = $('#connectionURL').val();
	    var userId = $('#userId').val();
	    var password = $('#password').val();

	    $(".error").remove();

	    if (driverName.length < 1) {
	      $('#driverName').after('<span class="error">This field is required</span>');
	      count=1;
	    }
	    if (connectionURL.length < 1) {
	      $('#connectionURL').after('<span class="error">This field is required</span>');
	      count=1;
	    }
	    if (userId.length < 1) {
	      $('#userId').after('<span class="error">This field is required</span>');
	      count=1;
	    }
	   /*  if (password !="") {
	      $('#password').after('<span class="error">Invalid Password</span>');
	      count=1;
	    } */
	    if(count==0)
	    	{
	    	sourceFunction();
	    	}
	  });
	  $('#destinationTable').submit(function(e) {
		    e.preventDefault();
		    var count=0;
		    var driverName = $('#DdriverName').val();
		    var connectionURL = $('#DconnectionURL').val();
		    var userId = $('#DuserId').val();
		    var password = $('#Dpassword').val();

		    $(".error").remove();

		    if (driverName.length < 1) {
		      $('#DdriverName').after('<span class="error">This field is required</span>');
		      count=1;
		    }
		    if (connectionURL.length < 1) {
		      $('#DconnectionURL').after('<span class="error">This field is required</span>');
		      count=1;
		    }
		    if (userId.length < 1) {
		      $('#DuserId').after('<span class="error">This field is required</span>');
		      count=1;
		    }
		  /*   if (password !="") {
		      $('#Dpassword').after('<span class="error">Password must be empty</span>');
		      count=1;
		    } */
		    if(count==0)
		    	{
		    	DestinationFunction();
		    	}
		  });

	});
	function sourceFunction() {
		$.ajax({
			type : 'post',
			url : 'SourceConn',
			data : $('form[name="sourceconnection"]').serialize(),
			success : function(response) {
				if (response.validated) {
					//Set response				
					$('#resultContainer pre code').text(
							JSON.stringify(response.source));
					$('#resultContainer').show();
				}
				else
				{
				 var error=response.error;
			     alert(error);
				}
			}
		});

	};
	function DestinationFunction() {
		$.ajax({
			type : 'post',
			url : 'DestinationConn',
			data : $('form[name="destinationconnection"]').serialize(),
			success : function(response) {
				if (response.validated) {
					//Set response				
					$('#resultContainer1 pre code').text(
							JSON.stringify(response.destination));
					$('#resultContainer').hide();
					$('#resultContainer1').show();
				}
				else
				{
				 var error=response.error;
			     alert(error);
				}
				
			}
		});

	};
</script>
</head>
<body>
<div id="resultContainer" style="display: none;">

				<h4 style="color: green;">Source Connected Successfully</h4>
				<pre style="color: green;">
    <code></code>
   </pre>
			</div>
	<div id="resultContainer1" style="display: none;">

				<h4 style="color: green;">Source and Destination Connected Successfully</h4>
				<pre style="color: green;">
    <code></code>
   </pre>
				<hr />
			</div>
			<div class="container" >
 
<div class="span6">
	<form:form id="sourceTable" modelAttribute="source" name="sourceconnection" class="form-signin">
		<div id="source">
			<h1 align="center">Source</h1>
			<div class="form-group">
				<label for="driverName">DriverName:</label> <input type="text" class="form-control"
					name="driverName" id="driverName" />
			</div>
			<div class="form-group">
				<label for="connectionURL">connectionURL:</label> <input
					type="text" class="form-control" name="connectionURL" id="connectionURL"
					 />
			</div>
			<div class="form-group">
				<label for="userId">userId:</label> <input type="text"
					class="form-control" name="userId" id="userId" />
			</div>
			<div class="form-group">
				<label for="password">password:</label> <input type="password"
					class="form-control" name="password" id="password"/>
			</div>
			<button type="submit"
				class="btn btn-success">Connect</button>

		</div>
	</form:form>
	</div>
 
 <div class="span6">
	<form id="destinationTable" name="destinationconnection" class="form-signin">
		<div  id="destination">
			<h1 align="center">Destination</h1>
			<div class="form-group">
				<label for="driverName">DriverName:</label> <input type="text"
					class="form-control" name="driverName" id="DdriverName" />
			</div>
			<div class="form-group">
				<label for="connectionURL">connectionURL:</label> <input
					type="text" class="form-control" name="connectionURL" id="DconnectionURL"	/>
			</div>
			<div class="form-group">
				<label for="userId">userId:</label> <input type="text"
					class="form-control" name="userId" id="DuserId" />
			</div>
			<div class="form-group">
				<label for="password">password:</label> <input type="password"
					class="form-control" name="password" id="Dpassword" />
			</div>
			<button type="submit"
				class="btn btn-success">Connect</button>

		</div>
	</form>
	 
</div>
 
</div>
<h1 align="center">To Enter Table details...Click here</h1>
	<form action="table" id="table">
	<div class="container" align="center" id="table">
	<button type="submit" class="btn btn-success">Table</button>
	</div>
	</form>
	
</body>
</html>