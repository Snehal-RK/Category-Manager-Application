<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> ADD CATEGORY </title>

<link rel="stylesheet" href="Bootstrap/bootstrap.min.css">
<style>
	#categoryInput{ text-transform: capitalize }
	.success{ color : green }
	.error{ color : red }
	#msgContainer{
		margin-top: 10px;
		font-weight: bold;
	}
</style>

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
						<form action="addCategoryProcess.jsp" method="post" id="categoryForm">
							<label class="text-light"> Enter category </label>
							<input type="text" name="addCategory" id="categoryInput" class="form-control">
							
							<input type="submit" id="addCategory" value="ADD CATEGORY" class="btn btn-primary mt-3">
							<a class="btn btn-primary mt-3 float-right" href="categoryList.jsp"> CATEGORY LIST </a>
						</form>
					</div>
				</div>
				<div id="msgContainer">
				<%
					if(session.getAttribute("message") != null){
				%>
					<p class="<%= session.getAttribute("messageType") %>">
						<%= session.getAttribute("message") %>
					</p>
				<%
						session.removeAttribute("message");
						session.removeAttribute("messageType");
					}
				%>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript" src="Bootstrap/jquery.js"></script>
	<script type="text/javascript" src="Bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript">
		// Get the input element and the message container
		const categoryForm = document.getElementById("categoryForm");
		const categoryInput = document.getElementById("categoryInput");
		const msgContainer = document.getElementById("msgContainer");
		const addCategoryButton = document.getElementById("addCategory");
		
		function toCamelCase(str) {
			return str.toLowerCase().replace(/(?:^w|[A-Z]|\b\w)/g, function(word, index){
				return word.toUpperCase();
			})
			.replace(/\s+/g,"");
		}
		
		// validation and confirmation
		addCategoryButton.addEventListener('click', function(event) {
			let categoryValue = categoryInput.value.trim();
			
			if(categoryValue === "") {
				event.preventDefault();
				msgContainer.innerHTML = '<p class="error"> Category cannot be empty ! </p>';
				categoryInput.focus();
				return;
			}
			
			if(categoryValue > 30) {
				event.preventDefault();
				msgContainer.innerHTML = '<p class="error"> Category cannot be longer that 30 characters ! </p>'
			}
			
			categoryInput.value = toCamelCase(categoryValue);
			msgContainer.innerHTML = "";
			
			// Confirmation prompt
			if (confirm("Are you sure you want to add category : "+categoryInput.value+" ? ")) {
				// If user confirm form will submit as normal
				categoryForm.submit();	// Explicitely usbmit the form
			}
			else {
				// Prevent form submission if user cancels
				event.preventDefault();
			}
		})
		
		// Add an event listener to the input field
		categoryInput.addEventListener('input', function() {
			// Clear msg container's content when input changes
			msgContainer.innerHTML = "";
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
</body>
</html>