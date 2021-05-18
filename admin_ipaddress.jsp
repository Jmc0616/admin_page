<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.sql.*"%>
<%@page import="java.net.InetAddress"%>

<%
try {
    String ip = InetAddress.getLocalHost().getHostAddress();
    out.print(ip);

} catch (Exception e) {
    e.printStackTrace();
}

/* 리눅스용 
try {
    String ip = null;

    boolean isLoopBack = true;
    Enumeration<NetworkInterface> en;		
    en = NetworkInterface.getNetworkInterfaces();

    while(en.hasMoreElements()) {
        NetworkInterface ni = en.nextElement();
        if (ni.isLoopback())
            continue;

        Enumeration<InetAddress> inetAddresses = ni.getInetAddresses();
        while(inetAddresses.hasMoreElements()) { 
            InetAddress ia = inetAddresses.nextElement();
            if (ia.getHostAddress() != null && ia.getHostAddress().indexOf(".") != -1) {
                ip = ia.getHostAddress();
                System.out.println(ip);
                isLoopBack = false;
                break;
            }
        }
        if (!isLoopBack)
            break;
    }
    System.out.println(" IP  =   " + ip);
} catch (SocketException e) {
    e.printStackTrace();
}
*/

%>