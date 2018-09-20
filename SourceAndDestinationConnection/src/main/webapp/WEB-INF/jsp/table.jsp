<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Table</title>
</head>
<style type="text/css">
#Table {
	float: left;
	border: 1px solid black;
}
span.error {
	color: red;
	margin-left: 10px;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script type="text/javascript">
	
$(document).ready(function() {

	  $('#Table').submit(function(e) {
		 e.preventDefault();
		    var count=0;
		  var sourceTable=$('#sourceTable').val();
	    var destTable = $('#destTable').val();
	    var forceMatch = $('#forceMatch').val();
	    var sourceSchema = $('#sourceSchema').val();
	    var destSchema = $('#destSchema').val();
        var clause=$('#clause').val();
	    $(".error").remove();
	    if (sourceTable.length < 1) {
		      $('#sourceTable').after('<span class="error">This field is required</span>');
		      count=1;
		    }

	    if (destTable.length < 1) {
	      $('#destTable').after('<span class="error">This field is required</span>');
	      count=1;
	    }
	    if (forceMatch.length < 1) {
	      $('#forceMatch').after('<span class="error">This field is required</span>');
	      count=1;
	    }
	    if (sourceSchema.length < 1) {
	      $('#sourceSchema').after('<span class="error">This field is required</span>');
	      count=1;
	   
	    }
	    if (destSchema.length < 1) {
	      $('#destSchema').after('<span class="error">This field is required</span>');
	      count=1;
	   
	    }
	    if (clause.length !=0) {
		      $('#clause').after('<span class="error">Make Empty to fetch all details</span>');
		      count=1;
		   
	    }
	    if(count==0)
	    	{
	    	Table();
	    	}
	  });
}); 
function Table() {
	$.ajax({
		type : 'post',
		url : 'alltable',
		data : $('form[name="tableconnection"]').serialize(),
		success : function(response) {
			if (response.validated) {
				//Set response				
				$('#resultContainer pre code').text(
						JSON.stringify(response.table));
				$('#resultContainer').show();
			}
		}
	});

};
</script>
<body>
<form name=tableconnection id="Table">
<div class="container">
<h1 >Table</h1>
<div id="resultContainer" style="display: none;">

				<h4 style="color: green;">Table Connected Successfully</h4>
				<pre style="color: green;">
    <code></code>
   </pre>
				<hr />
			</div>
			<div class="form-group">
	<label for="sourceTable">Source Table</label> <input type="text" name="sourceTable" id="sourceTable" />
			</div>
<div class="form-group">
	<label for="destTable">Destination Table</label> <input type="text" name="destTable" id="destTable" />
			</div>
	<div class="form-group">
		<label for="forceMatch">Force Match</label> 
		<input type="text" name="forceMatch" id="forceMatch" />
			</div>
			<div class="form-group">
				<label for="">Source Schema</label> <input type="text" name="sourceSchema" id="sourceSchema" />
			</div>
			<div class="form-group">
				<label for="destSchema">Destination Schema</label> <input type="text"
					name="destSchema" id="destSchema" />
			</div>
			<div class="form-group">
				<label for="clause">clause</label> <input type="text"
					name="clause" id="clause" />
			</div>
			<input type="submit" value="Connect" />
				</div>
				</form>
</body>
</html>