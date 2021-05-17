<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<table width="100%" border="1">
    <tr>
        <th>시간</th>
        <th>바꾼 ID</th>
        <th>바뀐 ID</th>   
        <th>변경 내용</th>
    </tr>
<%
    Class.forName("org.mariadb.jdbc.Driver");
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try{
        String jdbcDriver = "jdbc:mysql://localhost/safethings";
        String dbUser = "safethings";
        String dbPwd = "tpdlvmEld!!@@";
            
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
        pstmt = conn.prepareStatement("select * from user_manage_log");
        rs = pstmt.executeQuery();

        while(rs.next()){
%>
    <tr>
        <td><%= rs.getString("mod_date") %></td>
        <td><%= rs.getString("modified_by") %></td>
        <td><%= rs.getString("modified_id") %></td>
        <td><%= rs.getString("modified_content") %></td>
    </tr>
<%
        }
    }catch(SQLException se){
        se.printStackTrace();
    }finally{
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
%>
