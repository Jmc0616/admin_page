<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*"%>
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

        String sql = "update users set password=?, privilege=?, description=?, timeout=?, access_ip=? where id=?";
        
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,password);
		pstmt.setString(2,privilege);
		pstmt.setString(3,description);
		pstmt.setString(4,timeout);
		pstmt.setString(5,access_ip);
        pstmt.setString(6,id);

        pstmt.executeUpdate();

        pstmt.close();
        conn.close();
        

    }

    catch(Exception e){
		out.print("Exception Error...");
		out.print(e.toString());
    }
%>