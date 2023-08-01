<%-- 
    Document   : cust_add
    Created on : Jun 16, 2023, 8:52:23 PM
    Author     : Harish
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD Customer</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    </head>
    <body>
        <form action="cust_add.jsp" method="post">
            <div align="center" style="font-size: 40px;margin-top: 200px;">
                <pre>
      <label >Customer Name: </label><input  type="text"  placeholder="Ram" name="cname" required>
      <label >Address:       </label><input  type="text"  placeholder="Borivali" name="cadd" required>
      <label >Mobile no.:    </label><input  type="text"  placeholder="7012345678" name="cmobile" required>
      <label >Balance Amount:</label><input  type="text"  placeholder="000" name="blanceAmt" required>
                <button type="submit" class="btn btn-success">ADD</button>      <button type="button" class="btn btn-success"><a href ="index.jsp" style="text-decoration:none; color: white">BACK</a></button>
                </pre>  
            </div>
        </form>

        <%
            String cname = request.getParameter("cname");
            String cadd = request.getParameter("cadd");
            String cmobile = request.getParameter("cmobile");
            String cbalance = request.getParameter("blanceAmt");

            if (request.getMethod().equalsIgnoreCase("post")) {

                // Establish a database connection
                try {

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/daraj", "root", "");

                    PreparedStatement p = conn.prepareStatement("insert into customer_detail values(?,?,?,?,?)");

                    p.setString(1, "0");
                    p.setString(2, cname);
                    p.setString(3, cadd);
                    p.setString(4, cmobile);
                    p.setString(5, cbalance);

                    int i = p.executeUpdate();
                    if (i > 0) {
                        out.println("succesfully");
                    }

                } catch (Exception ex) {
                    ex.printStackTrace();
                    out.println(ex.getMessage());
                }
            }
        %>
    </body>
</html>
