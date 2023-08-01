<%-- 
    Document   : addproduct
    Created on : Jun 1, 2023, 10:01:52 PM
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="addproduct.jsp" method="post">
            <div align="center" style="font-size: 40px;margin-top: 200px;">
                <pre>
      <label >Product Name:</label><input  type="text"  placeholder="PG4" name="pname" required>
                    <button type="submit" class="btn btn-success">ADD</button>      <button type="button" class="btn btn-success"><a href ="index.jsp" style="text-decoration:none; color: white">BACK</a></button>
                </pre>  
            </div>
        </form>
        <%
            String pname = request.getParameter("pname");

            if (request.getMethod().equalsIgnoreCase("post")) {

                // Establish a database connection
                try {

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/daraj", "root", "");

                    PreparedStatement p = conn.prepareStatement("insert into product_detail values(?,?)");

                    p.setString(1, "0");
                    p.setString(2, pname);

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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    </body>
</html>
