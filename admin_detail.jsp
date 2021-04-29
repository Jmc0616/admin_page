<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
request.setCharacterEncoding("utf-8");

String idx = request.getParameter("idx");

try{
    Class.forName("org.mariadb.jdbc.Driver");

    String jdbcDriver = "jdbc:mysql://localhost/safethings";
    String dbUser = "safethings";
    String dbPwd = "tpdlvmEld!!@@";
        
    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
    pstmt = conn.prepareStatement("select * from users where id = ?");

}
