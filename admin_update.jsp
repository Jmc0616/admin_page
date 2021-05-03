<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%
    Class.forName("org.mariadb.jdbc.Driver");
    Connection conn=null; 
    PreparedStatement pstmt=null; 
    ResultSet re = null; 

    String id = request.getParameter("id");
    String password = request.getParameter("password");
	String privilege = request.getParameter("privilege");
	String description = request.getParameter("description");
	String timeout = request.getParameter("timeout");
	String access_ip = request.getParameter("access_ip");

    try{
        String jdbcDriver = "jdbc:mysql://localhost/safethings";
        String dbUser = "safethings";
        String dbPwd = "tpdlvmEld!!@@";
        
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);

        String sql = "update users set password=?, privilege=?, description=?, timeput=?, access_ip=? where id=?";
        
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,password);
		pstmt.setString(2,privilege);
		pstmt.setString(3,description);
		pstmt.setString(4,timeout);
		pstmt.setString(5,access_ip);
        pstmt.setString(6,id);
        out.println(pstmt);

        re = pstmt.executeQuery();

        pstmt.close();
        conn.close();
        re.close();

    }

    catch(Exception e){
        e.printStackTrace();
    }
%>