<%-- 
    Document   : newjsp
    Created on : 06-oct-2016, 13:09:16
    Author     : alumno
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
            } catch (ClassNotFoundException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }

            Connection conn = null;
            Statement stmt = null;
            
            try {
                String url = "jdbc:mysql://localhost:3306/spacex";
                conn = DriverManager.getConnection(url, "root", "");
                String sql = "SELECT c.nombre FROM cohete c";
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
                rs.next();
                System.out.println(rs.getString("nombre"));
            } catch (SQLException ex) {
                System.err.println(ex.getMessage());
            }
        %>
    </body>
</html>
