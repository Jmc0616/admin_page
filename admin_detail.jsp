<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사용자 목록</title>
<title>Document</title>
<script language="javascript">
</script>
</head> 
<body>

<%
    Class.forName("org.mariadb.jdbc.Driver");
    Connection conn=null; 
    PreparedStatement pstmt=null; 
    ResultSet rs = null; 

    String id = request.getParameter("id");

    try{
        String jdbcDriver = "jdbc:mysql://localhost/safethings";
        String dbUser = "safethings";
        String dbPwd = "tpdlvmEld!!@@";
        
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
        
        pstmt = conn.prepareStatement("select* from users where id =" + id);
        out.println(pstmt);
        rs = pstmt.executeQuery(); 
<%-- %>
    <table width="70%" border="1">
    <tr>
        <td>아이디</td>
        <td>권한</td>
        <td>설명</td>
    </tr>
<%
        while(rs.next()){
%>
            <tr>
            <td><%= rs.getString("id") %></td>
            <td><%= rs.getString("privilege") %></td>
            <td><%= rs.getString("description") %></td>
            </tr>
<%
        }
%>  </table>
        pstmt.close();
        conn.close();
        rs.close();
        
    }
    catch(Exception e){
        e.printStackTrace();
    }
    // response.sendRedirect("admin_main.jsp");
%>

</body>
</html> --%>