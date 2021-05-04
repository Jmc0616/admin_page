<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*, java.io.*"%>

<%
    Class.forName("org.mariadb.jdbc.Driver");
    Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs = null;

    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("userId");
    String pw = request.getParameter("userPW");
    String ad = "admin";

try {

    String jdbcDriver = "jdbc:mysql://localhost/safethings";
    String dbUser = "safethings";
    String dbPwd = "tpdlvmEld!!@@";

    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
    pstmt = conn.prepareStatement("select id, password, privilege from users where id='"+id+"'");

    rs = pstmt.executeQuery();
    rs.last();

    if(rs.getRow()>0) {
        if(!id.equals(rs.getString("id"))){

            %>
            <script>
            alert('아이디를 확인해주세요!');
            </script>
            <%
        }
        else if(!pw.equals(rs.getString("password"))){
            %>
            <script>
            alert('비밀번호를 확인해주세요!');
            </script>
            <%
        }
        else if(!ad.equals(rs.getString("privilege"))){
            session.setMaxInactiveInterval(14400);
            session.setAttribute("id",id);

            %>
            <script>
            location.href="../../main.jsp";
            </script>
            <%
        }
        else{

            %>
            <script>
            location.href="admin_main.jsp";
            </script>
            <%
        }
    }
}

catch(Exception e){
	out.print("Exception Error...");
	out.print(e.toString());
}
finally{
    rs.close();
    pstmt.close();
    conn.close();
}

%>
