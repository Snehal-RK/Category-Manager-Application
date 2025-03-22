<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> PRODUCTS </title>

<!-- Bootstrap link -->
<link rel="stylesheet" href="Bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="AdminDashboard.css">

</head>
<body class="bg-dark">
	
	<div class="container mt-3">
		<div class="row">
			<div class="offset-3 col-6">
				<table class="table table-borderless border-bottom border-primary rounded table-primary text-white bg-dark">
					<thead class="bg-primary border-primary rounded rounded-1">
						<tr>
							<th scope="col"><h3> ~ </h3></th>
							<th scope="col"><h3> CATEGORY </h3> </th>
							<th scope="col" class="float-right mr-2"><h3> ACTION </h3></th>
						</tr>
					</thead>
					<tbody>
						<%
							Class.forName("com.mysql.cj.jdbc.Driver");
							
							// DB URL
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/categories", "root", "");
							
							// Query to fetch and display values from database into a table
							String sql = "SELECT * FROM category_list";
							PreparedStatement statement = con.prepareStatement(sql);
							
							int n = 0;
							ResultSet result = statement.executeQuery();
							while(result.next()){
						%>
						<tr>
							<th class="p-3"> <%= ++n %></th>
							<td class="p-3"><%= result.getString(2) %></td>
							<td>
								<a 
									class="btn btn-danger float-right" 
									href="manageCategory.jsp?id=<%= result.getInt(1) %>"
									onclick="confirmDelete('<%= result.getInt(1) %>', '<%= result.getString(2) %>')">
									 DELETE 
								</a>
							</td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<div class="d-flex justify-content-center">
					<a class="btn btn-primary mt-2" href="AddCategory.jsp"> Home </a>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="Bootstrap/jquery.js"></script>
	<script type="text/javascript" src="Bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript">
		function confirmDelete(categoryId , categoryName) {
			if(confirm("Are you sure you want to delete category : "+categoryName+" ? ")){
				window.location.href = "manageCategory.jsp?id="+categoryId;
			}
		}
	</script>
</body>
</html>
