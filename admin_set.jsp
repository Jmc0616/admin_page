<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8");%>

<% 
String id = request.getParameter("id");
String password= request.getParameter("password");
String privilege = request.getParameter("privilege");
String description = request.getParameter("description");
String timeout = request.getParameter("timeout");
String access_ip = request.getParameter("access_ip");

Connection conn=null;
PreparedStatement stmt=null;
String str="";
try{
	String myUrl = "jdbc:mysql://localhost/safethings";
	String ID = "safethings";
	String PW = "tpdlvmEld!!@@";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(myUrl, ID, PW);

	String query = " insert into history (id, password, privilege, description, timeout, access_ip) values (?, ?, ?, ?, ?, ?)";
	
	stmt=conn.prepareStatement(query);
	stmt.setString(1,id);
	stmt.setString(2,password);
	stmt.setString(3,privilege);
	stmt.setString(4,description);
	stmt.setString(5,timeout);
	stmt.setString(6,access_ip);
	
	out.println("member 테이블에 새로운 레코드를 추가했습니다.");

	}catch(Exception e){ 
		e.printStackTrace();
		out.println("member 테이블에 새로운 레코드를 추가에 실패했습니다");
	}finally{
		if(stmt != null) 
			try{stmt.close();}catch(SQLException query){}
		if(conn != null) 
			try{conn.close();}catch(SQLException query){}
	}
%>
