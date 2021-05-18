<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
        
        pstmt = conn.prepareStatement("select* from users where id ='"+id+"'");
        rs = pstmt.executeQuery(); 

        while(rs.next()){
%>
            <A href="admin_delete.jsp?id=<%=rs.getString("id")%>">제거</A>
            
            <form name="update" action="admin_update.jsp" method="post">
            <input type="submit" value="수정">

            <table width="30%" border="1">
            <tr><td>최종 수정일 </td><td> <%= rs.getString("mod_date") %></td></tr>
            <tr><td>작성자 </td><td> <%= rs.getString("parent_id") %></td></tr>
            <tr><td>아이디 </td><td> <input name="id" readonly value="<%= rs.getString("id") %>"> </td></tr>
            <tr><td>비밀번호 </td><td> <input Type="Text" size="20" name="password" value="<%= rs.getString("password") %>"> </td></tr>
            <tr><td>권한 </td><td> 
            <select name = "privilege">
            <option value = "<%= rs.getString("privilege") %>" selected="selected"> <%= rs.getString("privilege") %> </option>
            <option value = "basic User"> 일반 사용자 </option>
            <option value = "Policy Manager"> 정책 관리자 </option>
            <option value = "admin"> ROOT </option>
            </select>
            <tr><td>설명 </td><td> <input Type="Text" size="20" name="description" value="<%= rs.getString("description") %>"> </td></tr>
            <tr><td>연결유지시간 </td><td> <input Type="Text" size="20" name="timeout" value="<%= rs.getString("timeout") %>"> </td></tr>
            <tr><td>접근허용IP </td><td> <input Type="Text" size="20" name="access_ip" value="<%= rs.getString("access_ip") %>"> </td></tr>

<%
        }
%> 
</table>
<%
        pstmt.close();
        conn.close();
        rs.close();
        
    }
    catch(Exception e){
       	out.print("Exception Error...");
		out.print(e.toString());
    }
%>
