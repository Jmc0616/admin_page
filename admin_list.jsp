<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<table width="50%" border="1">
<thead>
    <tr>
        <th>아이디</th><th>설명</th>
        <TD>기능</TD>
    </tr>
</thead>
<tbody>
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
            pstmt = conn.prepareStatement("select * from users");
            rs = pstmt.executeQuery();
            
            while(rs.next()){
    %>
    
        <tr>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("description") %></td>
        
        <TD>
        <input type="button" value="상세 정보" onclick="window.open('admin_detail.jsp?id=<%=rs.getString("id")%>')"/>
        </TD>
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
    </tbody>
</table>
</body>
</html>