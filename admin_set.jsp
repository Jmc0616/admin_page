<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<%@page import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>

<%

SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
Date currentTime = new Date ();
String mTime = mSimpleDateFormat.format ( currentTime );

request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String password = request.getParameter("password");
String privilege = request.getParameter("privilege");
String description = request.getParameter("description");
String timeout = request.getParameter("timeout");
String access_ip = request.getParameter("access_ip");
String par = session.getAttribute("id").toString();

Connection conn=null; //DB연결
PreparedStatement pstmt=null; //SQL문
ResultSet re = null; //해제

try{
	Class.forName("org.mariadb.jdbc.Driver");
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
	
	int result = pstmt.executeUpdate();
	
	pstmt.close();

	pstmt=conn.prepareStatement("INSERT INTO user_manage_log (mod_date, modified_by, modified_id, modified_content) VALUES (?, ?, ?, ?)");
	pstmt.setString(1,mTime);
	pstmt.setString(2,par);
	pstmt.setString(3,id);
	pstmt.setString(4,"new");
	result = pstmt.executeUpdate();

	pstmt.close();


	if(result!=0){
	out.println("<script>");
	out.println("location.href='admin_set.jsp'");
	out.println("완료");
	out.println("</script>");
	}else {
	out.println("<script>");
	out.println("location.href='admin_set.jsp'");
	out.println("실패");
	out.println("</script>");
	}
}catch(Exception e){
	e.printStackTrace();    
	}finally{
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
        }%>    
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
    alert('추가되었습니다.');
      
      window.close(); 

</script>
</head>
<body>

</body>
</html>
