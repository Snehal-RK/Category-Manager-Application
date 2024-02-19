<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/categories", "root", "");
	PreparedStatement statement = con.prepareStatement("INSERT INTO category_list (cat_name) VALUE(?)");
	
	statement.setString(1, request.getParameter("addCategory"));
	int addResult = statement.executeUpdate();
	
	if(addResult!=0){
		response.sendRedirect("AddCategory.jsp");
	}
	else{
		response.sendRedirect("AddCategory.jsp");
	}

%>