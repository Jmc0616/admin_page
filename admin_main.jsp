<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
    <title>layout</title>
</head>
<body>
    
    <table width="400" border="1" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <jsp:include page="admin_list.jsp" flush="false"/>
            </td>
        </tr>
        <br><br><br><br><br>
        <tr>
            <td>
                <jsp:include page="admin_history.jsp" flush="false"/>
            </td>
        </tr>
    </table>
    
</body>
</html>