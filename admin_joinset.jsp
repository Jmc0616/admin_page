<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.* "%>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<%@page import="java.util.Date, java.text.SimpleDateFormat"%>
<%
    request.setCharacterEncoding("UTF-8");
	Class.forName("org.mariadb.jdbc.Driver");

	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
	Date currentTime = new Date ();
	String mTime = mSimpleDateFormat.format (currentTime);
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String privilege = request.getParameter("privilege");
	String description = request.getParameter("description");
	String timeout = request.getParameter("timeout");
	String access_ip = request.getParameter("access_ip");
	String par = session.getAttribute("parent_id").toString();

    Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet re = null;

	try{
		String DB_URL = "jdbc:mysql://localhost/safethings";
		String ID = "safethings";
		String PW = "tpdlvmEld!!@@";
		
		conn = DriverManager.getConnection(DB_URL,ID,PW);
		
		pstmt=conn.prepareStatement("INSERT INTO users (id, password, privilege, description, timeout, access_ip, parent_id, reg_date, mod_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
		pstmt.setString(1,id);
		pstmt.setString(2,password);
		pstmt.setString(3,privilege);
		pstmt.setString(4,description);
		pstmt.setString(5,timeout);
		pstmt.setString(6,access_ip);
		pstmt.setString(7,par);
		pstmt.setString(8,mTime);	
		pstmt.setString(9,mTime);
	
		re = pstmt.executeQuery();
		
		pstmt=conn.prepareStatement("INSERT INTO user_manage_log (mod_date, modified_by, modified_id, modified_content) VALUES (?, ?, ?, ?)");
		pstmt.setString(1,mTime);
		pstmt.setString(2,par);
		pstmt.setString(3,id);
		pstmt.setString(4,"new");

		re = pstmt.executeQuery();
	}
	catch(Exception e){
		e.printStackTrace();    
	}
	finally{

		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		if(re != null) re.close();
	}
%>  
<%-- <script>
    alert('추가되었습니다.');
    window.close(); 
</script> --%>