<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat"%>

<%
    Class.forName("org.mariadb.jdbc.Driver");
    Connection conn=null; 
    PreparedStatement pstmt=null; 
    ResultSet re = null; 

    SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
	Date currentTime = new Date ();

	String date = mSimpleDateFormat.format(currentTime);
	String par = (String)session.getAttribute("id");

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

		pstmt=conn.prepareStatement("INSERT INTO user_manage_log (mod_date, modified_by, modified_id, modified_content) VALUES (?, ?, ?, ?)");
		pstmt.setString(1,date);
		pstmt.setString(2,par);
		pstmt.setString(3,id);
		pstmt.setString(4,"Modify Information");

		re = pstmt.executeQuery();

        pstmt.close();
        conn.close();
        

    }

    catch(Exception e){
		out.print("Exception Error...");
		out.print(e.toString());
    }
    response.sendRedirect("admin_main.jsp");

%>