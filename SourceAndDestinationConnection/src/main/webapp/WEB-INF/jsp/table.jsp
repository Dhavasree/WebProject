<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<title>Table</title>
</head>
<style type="text/css">
#Table {
	float: left;
	border: 1px solid black;
	margin-top: 25px;
    margin-bottom: 100px;
    margin-right: 150px;
    margin-left: 80px;
        padding: 10px;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<body>
<form:form id="Table" modelAttribute="table" action="alltable">
<div class="container">
<h1 >Table</h1>
			<div class="form-group">
	<label for="sourceTable">Source Table</label> <input type="text" class="form-control" name="sourceTable" id="sourceTable"  placeholder="Enter Source Table"/>
			</div>
<div class="form-group">
	<label for="destTable">Destination Table</label> <input type="text" class="form-control" name="destTable" placeholder="Enter Destination Table" id="destTable" />
			</div>
	<div class="form-group">
		<label for="forceMatch">Force Match</label> 
		<input type="text" class="form-control" name="forceMatch" placeholder="Enter Force Match" id="forceMatch" />
			</div>
			<div class="form-group">
				<label for="">Source Schema</label> <input type="text" class="form-control" name="sourceSchema" placeholder="Enter Source schema" id="sourceSchema" />
			</div>
			<div class="form-group">
				<label for="destSchema">Destination Schema</label> <input type="text" class="form-control"
					name="destSchema" placeholder="Enter Destination Schema" id="destSchema" />
			</div>
			<div class="form-group">
				<label for="columns">columns</label> <input type="text" class="form-control"
					name="columns"  placeholder="Enter Columns" id="columns" />
			</div>
			<div class="form-group">
				<label for="clause">clause</label> <input type="text" class="form-control"
					name="clause" placeholder="Enter Clause" id="clause" />
			</div>
			<input type="submit" value="Connect" class="btn btn-success"/>
				</div>
				</form:form>
</body>
</html>