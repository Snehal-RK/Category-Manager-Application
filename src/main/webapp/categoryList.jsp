<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> CATEGORY LIST </title>

<link rel="stylesheet" href="Bootstrap/bootstrap.min.css">

</head>
<body class="bg-dark">

	<div class="container mt-3 mb-3">
		<div class="row">
			<div class="offset-3 col-6">
				<div class="card border border-solid border-primary">
					<div class="card-header bg-primary text-white text-center">
						<h2> CATEGORIES </h2>
					</div>
					
					<form action="deleteCategory.jsp" method="post">
						<div class="card-body bg-dark">
							<div>
								<label class="text-light"> Find Category </label>
								<select class="form-control">
							<%
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/categories", "root", "");
								PreparedStatement statement = con.prepareStatement("SELECT * FROM category_list");
								ResultSet addResult = statement.executeQuery();
								while(addResult.next()){
							%>
									<option class="dropdown block" id="catOptions" value="<%= addResult.getInt(1) %>"> <%= addResult.getString(2) %> </option>
							<%
								}
							%>
								</select>
							</div>
							<div>
								<a class="btn btn-primary mt-3" href="AddCategory.jsp"> BACK </a>
								<a class="btn btn-primary mt-3 float-right" href="deleteCategory.jsp"> DELETE CATEGORY </a>
							</div>
							
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript" src="Bootstrap/jquery.js"></script>
	<script type="text/javascript" src="Bootstrap/bootstrap.min.js"></script>
</body>
</html>