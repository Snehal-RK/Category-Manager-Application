<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
	// Driver for JDBC connection
	Class.forName("com.mysql.cj.jdbc.Driver");
			
	// Database connection host , id and password
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/categories", "root", "");
	
	// Your database query - ex : INSERT , UPDATE , DELETE
	PreparedStatement statement = con.prepareStatement("INSERT INTO category_list (cat_name) VALUE(?)");
	
	// fetch parameters sent by forms
	statement.setString(1, request.getParameter("addCategory"));
	int addResult = statement.executeUpdate();		
	
	if(addResult!=0){
		session.setAttribute("message", "Category added successfully..!");
		session.setAttribute("messageType" , "success");
		response.sendRedirect("AddCategory.jsp");
	}
	else{
		session.setAttribute("message", "Error adding category..!");
		session.setAttribute("messageType" , "error");
		response.sendRedirect("AddCategory.jsp");
	}

%>