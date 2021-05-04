<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.* "%>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<%@page import="java.util.Date, java.text.SimpleDateFormat"%>
<%@page import="java.security.*"%>

<%
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet re = null;

	SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
	Date currentTime = new Date ();
	String mTime = mSimpleDateFormat.format(currentTime);
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String privilege = request.getParameter("privilege");
	String description = request.getParameter("description");
	String timeout = request.getParameter("timeout");
	String access_ip = request.getParameter("access_ip");
	String par = (String)session.getAttribute("id");

	PUBLIC String encryptSHA256(String password){
		String encryptData="";
		try{
			messageDigest sha = MessageDigest.getlnstance("SHA-256");
			sha.update(password.getBytes());
			byte[] digest = sha.digest();
			for(int i=0; i<digest.length; i++){
				String x = integer.toHexString(digest[i] & 0xff);
				if(x.length()<2)
				encryptData += "0";
				encryptData += x;

			}
		}catch(NoSuchAlgorithmException e){
			return encryptData;
		}
	}
	out.println(password);
	try{
		String jdbcDriver = "jdbc:mysql://localhost/safethings";
        String dbUser = "safethings";
        String dbPwd = "tpdlvmEld!!@@";
        
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
		
		pstmt=conn.prepareStatement("INSERT INTO users (id, password, privilege, description, timeout, access_ip, reg_date, mod_date, parent_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
		pstmt.setString(1,id);
		pstmt.setString(2,password);
		pstmt.setString(3,privilege);
		pstmt.setString(4,description);
		pstmt.setString(5,timeout);
		pstmt.setString(6,access_ip);
		pstmt.setString(7,mTime);	
		pstmt.setString(8,mTime);
		pstmt.setString(9,par);

		re = pstmt.executeQuery();
		
		pstmt=conn.prepareStatement("INSERT INTO user_manage_log (mod_date, modified_by, modified_id, modified_content) VALUES (?, ?, ?, ?)");
		pstmt.setString(1,mTime);
		pstmt.setString(2,par);
		pstmt.setString(3,id);
		pstmt.setString(4,"new");

		re = pstmt.executeQuery();

	}
	catch(Exception e){
		out.print("Exception Error...");
		out.print(e.toString());   
	}
	finally{

		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
		if(re != null) re.close();
%>
		<script>
    	alert('추가되었습니다.');
    	window.close(); 
		</script>
<%
	}
%>  
