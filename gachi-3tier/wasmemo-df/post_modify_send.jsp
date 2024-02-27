<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
    
 	String writer = request.getParameter("writer");
 	String title = request.getParameter("title");
 	String content = request.getParameter("content");
    
    String num = request.getParameter("num");
    
    String insertQuery = "SELECT * FROM pratice_board.post WHERE num=" + num;
    
 	PreparedStatement psmt = connection.prepareStatement(insertQuery);
 	
 	ResultSet result = psmt.executeQuery();
 	
 	while(result.next())
 	{
        insertQuery = "UPDATE pratice_board.post set title=?, writer=?, content=? WHERE num=" + num;
 	    
 	    psmt = connection.prepareStatement(insertQuery);
        
        psmt.setString(1, title);
        psmt.setString(2, writer);
        psmt.setString(3, content);
        
        psmt.executeUpdate();
        
        response.sendRedirect("post_list.jsp");
 	}
}
catch (Exception ex)
{
	out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
}
%>

