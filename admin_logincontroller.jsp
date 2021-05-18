<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*, java.io.*"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.util.Date, java.text.SimpleDateFormat"%>

<%
    Class.forName("org.mariadb.jdbc.Driver");
    Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs = null;

    request.setCharacterEncoding("utf-8");

    SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
	Date currentTime = new Date ();

	String date = mSimpleDateFormat.format(currentTime);

    String id = request.getParameter("userId");
    String pw = request.getParameter("userPW");
    
    String user = "basic User";
    String manage= "Policy Manager";
    String admin= "admin";

    // login_limit
    String login = request.getParameter("login_limit");

    // PW sha256
    String PW = pw;
	MessageDigest md = MessageDigest.getInstance("SHA-256");
	md.update(PW.getBytes());
	String shaPW = String.format("%064x", new BigInteger(1, md.digest()));

try {
    String jdbcDriver = "jdbc:mysql://localhost/safethings";
    String dbUser = "safethings";
    String dbPwd = "tpdlvmEld!!@@";

    conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
    pstmt = conn.prepareStatement("select id, password, privilege, login_limit from users where id='"+id+"'");

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
        else if(rs.getString("login_limit").equals("5")) {
            %>
            <script>
                alert('해당 ID는 무분별한 로그인 실패로 잠금조치되었습니다!!');
            </script>
            <%
        }
        else if(!shaPW.equals(rs.getString("password"))){
            pstmt = conn.prepareStatement("update users set login_limit = login_limit+1 where id ='"+id+"'");
            pstmt.executeUpdate();
            out.print(pstmt);

            %>
            <script>
            alert('비밀번호를 확인해주세요!');
            </script>
            <%
        }
        else if(user.equals(rs.getString("privilege"))){
            session.setMaxInactiveInterval(14400);
            session.setAttribute("id",id);

            pstmt=conn.prepareStatement("INSERT INTO user_manage_log (mod_date, modified_by, modified_content) VALUES (?, ?, ?)");
            pstmt.setString(1,date);
            pstmt.setString(2,id);
            pstmt.setString(3,"User Login");

            %>
            <script>
            location.href="../../main.jsp";
            </script>
            <%
        }
        else if(manage.equals(rs.getString("privilege"))){
            session.setMaxInactiveInterval(14400);
            session.setAttribute("id",id);

            pstmt=conn.prepareStatement("INSERT INTO user_manage_log (mod_date, modified_by, modified_content) VALUES (?, ?, ?)");
            pstmt.setString(1,date);
            pstmt.setString(2,id);
            pstmt.setString(3,"User Login");

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