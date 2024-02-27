<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta checked="UTF-8">
<title>게시글 상세 열람</title>
</head>
<body>
    <h1>게시글 상세 열람</h1>
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
        
        String insertQuery = "SELECT * FROM pratice_board.post WHERE num=" + num;
        
        PreparedStatement psmt = connection.prepareStatement(insertQuery);
        
        ResultSet result = psmt.executeQuery(); %>
        
        <table border="1">
            <%
            while(result.next())
            {%>
            	<tr>
            	    <td>번호</td>
            	    <td><%=result.getInt("num") %></td>
            	</tr>
            	<tr>
            	    <td>작성일</td>
            	    <td><%=result.getTimestamp("reg_date") %></td>
            	</tr>
            	<tr>
            	    <td>작성자</td>
            	    <td><%=result.getString("writer") %></td>
            	</tr>
            	<tr>
            	    <td>제목</td>
            	    <td><%=result.getString("title") %></td>
            	</tr>
            	<tr>
            	    <td>내용</td>
            	    <td><%=result.getString("content") %></td>
            	</tr>
            	<tr>
            	    <td colspan="2">
            	        <button type=button onclick="location.href='post_list.jsp'">목록으로</button>
            	    </td>
            	</tr>
            	<%            	
            }%>
        </table>
        <%
    }
    catch (Exception ex)
    {
        out.println("오류가 발생했습니다. 오류 메시지 : " + ex.getMessage());
    }%>

</body>
</html>

