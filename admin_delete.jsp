<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*"%>

<%
    Class.forName("org.mariadb.jdbc.Driver");
    Connection conn=null; 
    PreparedStatement pstmt=null; 
    ResultSet re = null; 

    String id = request.getParameter("id");

    try{
        String jdbcDriver = "jdbc:mysql://localhost/safethings";
        String dbUser = "safethings";
        String dbPwd = "tpdlvmEld!!@@";
        
        
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
        
        pstmt = conn.prepareStatement("delete from users where id =" + id);
        re = pstmt.executeQuery();

        pstmt.close();
        conn.close();
        re.close();
        
    }
    catch(Exception e){
        e.printStackTrace();
    }
    // response.sendRedirect("admin_main.jsp");
%>