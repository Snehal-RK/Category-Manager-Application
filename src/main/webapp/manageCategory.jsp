<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/categories", "root", "");
	String sql = "DELETE FROM category_list WHERE cat_id=?";
	PreparedStatement statement = con.prepareStatement(sql);
	statement.setString(1, request.getParameter("id"));
	
	int deleteResult = statement.executeUpdate();
	
	if(deleteResult!=0){
		response.sendRedirect("deleteCategory.jsp");
	}
	else{
		response.sendRedirect("deleteCategory.jsp");
	}
%>