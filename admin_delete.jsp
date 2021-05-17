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

    try{
        String jdbcDriver = "jdbc:mysql://localhost/safethings";
        String dbUser = "safethings";
        String dbPwd = "tpdlvmEld!!@@";
        
        
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
        
        pstmt = conn.prepareStatement("delete from users where id ='"+id+"'");
        re = pstmt.executeQuery();

        pstmt=conn.prepareStatement("INSERT INTO user_manage_log (mod_date, modified_by, modified_id, modified_content) VALUES (?, ?, ?, ?)");
		pstmt.setString(1,date);
		pstmt.setString(2,par);
		pstmt.setString(3,id);
		pstmt.setString(4,"Delete Information");

		re = pstmt.executeQuery();

        re.close();
        pstmt.close();
        conn.close();
        
    }
    catch(Exception e){
        e.printStackTrace();
    }
    response.sendRedirect("admin_main.jsp");
%>