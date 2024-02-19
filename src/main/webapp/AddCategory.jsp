<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> ADD CATEGORY </title>

<link rel="stylesheet" href="Bootstrap/bootstrap.min.css">

</head>
<body class="bg-dark">

	<div class="container mt-3 mb-3">
		<div class="row">
			<div class="offset-3 col-6">
				<div class="card border border-solid border-primary">
					<div class="card-header bg-primary text-white text-center">
						<h2> ADD CATEGORY </h2>
					</div>
					
					<div class="card-body bg-dark">
						<form action="addCategoryProcess.jsp" method="post">
							<label class="text-light"> Enter category </label>
							<input type="text" name="addCategory" class="form-control">
							
							<input type="submit" value="ADD CATEGORY" class="btn btn-primary mt-3">
							<a class="btn btn-primary mt-3 float-right" href="categoryList.jsp"> CATEGORY LIST </a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript" src="Bootstrap/jquery.js"></script>
	<script type="text/javascript" src="Bootstrap/bootstrap.min.js"></script>
</body>
</html>