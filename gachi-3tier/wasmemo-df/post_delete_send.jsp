<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
try
{
    Class.forName("com.mysql.jdbc.Driver");
    String db_address = "jdbc:mysql://gachi-prd-rds.cvuyossqssoz.ap-northeast-2.rds.amazonaws.com:3306/pratice_board";
    String db_username = "admin";
    String db_pwd = "password";
    Connection connection = DriverManager.getConnection(db_address, db_username, db_pwd);
    
    request.setCharacterEncoding("UTF-8");
    
    String num = request.getParameter("num");
    
    String insertQuery = "DELETE FROM pratice_board.post WHERE num=" + num;
    
 	PreparedStatement psmt = connection.prepareStatement(insertQuery);

    psmt.executeUpdate();
 	
    response.sendRedirect("post_list.jsp");
}
catch (Exception ex)
{
	out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>

