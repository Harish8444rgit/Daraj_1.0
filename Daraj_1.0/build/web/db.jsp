<%-- 
    Document   : db
    Created on : Jun 14, 2023, 8:48:00 PM
    Author     : Harish
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String p1 = request.getParameter("p1");
            String p2 = request.getParameter("p2");
            String p3 = request.getParameter("p3");
            String p4 = request.getParameter("p4");
            String p5 = request.getParameter("p5");
            String q1 = request.getParameter("q1");
            String q2 = request.getParameter("q2");
            String q3 = request.getParameter("q3");
            String q4 = request.getParameter("q4");
            String q5 = request.getParameter("q5");
            String r1 = request.getParameter("r1");
            String r2 = request.getParameter("r2");
            String r3 = request.getParameter("r3");
            String r4 = request.getParameter("r4");
            String r5 = request.getParameter("r5");
            String date = request.getParameter("date");

            String paid1 = request.getParameter("paidamt");
            String totalp1 = request.getParameter("totalp1");
            String totalp2 = request.getParameter("totalp2");
            String totalp3 = request.getParameter("totalp3");
            String totalp4 = request.getParameter("totalp4");
            String totalp5 = request.getParameter("totalp5");
            String totalamt = request.getParameter("totalamt");
            String totalqt = request.getParameter("totalqt");
            String custid = request.getParameter("cname");
            String blance = request.getParameter("blance");
            String prevbal = request.getParameter("CustBlance");


        %>
        <%                 if (request.getMethod().equalsIgnoreCase("post")) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/daraj", "root", "");

                    PreparedStatement p = conn.prepareStatement("insert into  order_details values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

                    p.setString(1, "0");
                    p.setString(2, p1);
                    p.setString(3, r1);
                    p.setString(4, q1);
                    p.setString(5, p2);
                    p.setString(6, r2);
                    p.setString(7, q2);
                    p.setString(8, p3);
                    p.setString(9, r3);
                    p.setString(10, q3);
                    p.setString(11, p4);
                    p.setString(12, r4);
                    p.setString(13, q4);
                    p.setString(14, p5);
                    p.setString(15, r5);
                    p.setString(16, q5);

                    int i = p.executeUpdate();

                    PreparedStatement bd = conn.prepareStatement("insert into  bill_detail values(?,?,?,?,?,?,?)");
                    bd.setString(1, "0");
                    bd.setString(2, custid);
                    bd.setString(3, "1");
                    bd.setString(4, paid1);
                    bd.setString(5, totalamt);
                    bd.setString(6, date);
                    bd.setString(7, prevbal);

                    int j = bd.executeUpdate();

                    PreparedStatement db1 = conn.prepareStatement("UPDATE customer_detail SET blance_amt = ? WHERE cust_id = ?");
                    db1.setString(1, blance);
                    db1.setString(2, custid);
                    int k = db1.executeUpdate();
//                    i > 0 && j > 0 && 
                    if (i > 0 && j > 0 && k > 0) {
                        out.println("succesfully");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
                        dispatcher.include(request, response);
                    }

                } catch (Exception ex) {
                    ex.printStackTrace();
                    out.println(ex.getMessage());
                }
            }

        %>
    </body>
</html>
