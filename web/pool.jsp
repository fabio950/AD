<%-- 
    Document   : pool
    Created on : 13-oct-2016, 12:33:31
    Author     : alumno
--%>

<%@page import="javax.naming.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            InitialContext initCtx = new InitialContext();;
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource dataSource = (DataSource) envCtx.lookup("jdbc/spacex");

            Connection connection = dataSource.getConnection(); //Obtener la conexión del pool

            Statement stmt =connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM cohete");
            int id = 0;
            String nombre = "";
            
            while(rs.next()){
                id = rs.getInt("id");
                nombre = rs.getString("nombre");
                
        %>
            <h1>El id es <%=id%>, el nombre <%=nombre%></h1>
        <%
            }  
            connection.close(); //No se cierra realmente la conexión sino que se retorna al pool
        %>
    </body>
</html>
