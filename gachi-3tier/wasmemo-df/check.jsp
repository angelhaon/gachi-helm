<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import = "java.sql.*" %>
<%
    Connection conn = null;
    try{
        String url = "jdbc:mysql://gachi-prd-rds.cvuyossqssoz.ap-northeast-2.rds.amazonaws.com:3306/post";
        String id = "admin";
        String pw = "password";

        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(url, id, pw);
        out.println("success");
    }catch(Exception e){
        out.println("fail<hr>"+e);
    }
%>
