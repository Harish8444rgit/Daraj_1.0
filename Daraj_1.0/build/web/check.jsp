<%-- 
    Document   : check
    Created on : Jun 17, 2023, 8:02:52 PM
    Author     : Harish
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="style.css">
        <style>
            input[type="number"]{
                margin: 0;
                width: 120px;
            }
            #nobd {border: none;
                   padding: 10px;}
            .centered-form {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            #screenshotResult {
                margin-top: 20px;
            }

        </style>
    </head>
    <body>
        <% Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/daraj", "root", "");
            System.out.println("succesfully");
            String query = "SELECT cust_id, cust_name ,blance_amt,cust_add FROM customer_detail";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            StringBuilder optionsHtml1 = new StringBuilder();

            // Iterate over the product data and generate the dropdown options
            while (resultSet.next()) {
                String CustomerId = resultSet.getString("cust_id");
                String CustomerName = resultSet.getString("cust_name");
                String CustomerAdd = resultSet.getString("cust_add");
                optionsHtml1.append("<option value=\"").append(CustomerId).append("\">")
                        .append(CustomerName).append("</option>");
            }
            String query2 = "SELECT product_name FROM product_detail ;";
            Statement statement2 = connection.createStatement();
            ResultSet resultSet2 = statement2.executeQuery(query2);
            ArrayList<String> products = new ArrayList<>();
            while (resultSet2.next()) {
                products.add(resultSet2.getString("product_name"));
            }

        %>
        <form action="getbillser"  method="post" style="width: 800px; margin: 0 auto; background-color: #fff; padding: 30px; border: 1px solid #ccc;">
            <table border="2">

                <tr  rowspan="5" align="center">
                    <th colspan="5" > YADAV BORTHER'S CHILLI<br>
                        (JAI MAA AMBE)<br>
                        BMC BHAJI MARKET NEW SHOP XX<br>
                        BORIVALI  (W) MUMBAI 400092<br>
                        KISAN- 9619740373 VAKEEL- 9819614731 </th>
                </tr>
                <tr>
                    <td id="nobd"><label>Name:</label></td>
                    <td id="nobd" colspan="2"><select name="cname" id="test" onchange="getOption()">
                            <%= optionsHtml1.toString()%>
                        </select></td>
                    <td id="nobd"><label>Bill No:</label> </td>
                    <td  id="nobd"><input type="text" readonly="readonly" value="${billno}" name="bill_no"/></td>
                </tr>
                <tr>
                    <td id="nobd"><label>Add:</label></td>
                    <td  id="nobd" colspan="2"><input type="text" readonly="readonly" value="${cadd}" name=""/></td>
                    <td id="nobd"><label>Date:</label> </td>
                    <td id="nobd"><input type="text" placeholder="01-01-2023" name="date"/></td>
                </tr>
                <tr>
                    <td>Item</td>
                    <td colspan="2">Qty/Net.Wt.</td>
                    <td>Rate</td>
                    <td>Amount</td>

                </tr>
                <tr>
                    <td><label>${P1}</label></td>
                    <td colspan="2"><input type="text" readonly="readonly" value="${q1}" name="q1"/></td>
                    <td><input type="text" readonly="readonly" value="${r1}" name="r1"/></td>
                    <td><input type="text" readonly="readonly" value="${pt1}" name=""/></td>
                </tr>

                <tr>
                    <td> <label>${P2}</label></td>
                    <td colspan="2"><input type="text" readonly="readonly" value="${q2}" name="q2"/></td>
                    <td><input type="text" readonly="readonly" value="${r2}" name="r2"/></td>
                    <td><input type="text" readonly="readonly" value="${pt2}" name=""/></td>
                </tr>

                <tr>
                    <td><label>${P3}</label></td>
                    <td colspan="2"><input type="text" readonly="readonly" value="${q3}" name="q3"/></td>
                    <td><input type="text" readonly="readonly" value="${r3}" name="r3"/></td>
                    <td><input type="text" readonly="readonly" value="${pt3}" name=""/></td>
                </tr>
                <tr>
                    <td><label>${P4}</label></td>
                    <td colspan="2"><input type="text" readonly="readonly" value="${q4}" name="q4"/></td>
                    <td><input type="text" readonly="readonly" value="${r4}" name="r4"/></td>
                    <td><input type="text" readonly="readonly" value="${pt4}" name=""/></td>
                </tr>

                <tr>
                    <td><label>${P5}</label></td>
                    <td colspan="2"><input type="text" readonly="readonly" value="${q5}" name="q5"/></td>
                    <td><input type="text" readonly="readonly" value="${r5}" name="r5"/></td>
                    <td><input type="text" readonly="readonly" value="${pt5}" name=""/></td>
                </tr>

                <tr>
                    <td>Total</td>
                    <td colspan="2"><input type="text" readonly="readonly" value="" name=""/></td>
                    <td><label >Amount :</label></td>
                    <td><input type="text" readonly="readonly" value="${totalamt}" name="totalamt"/></td>
                </tr>

                <tr >
                    <td  colspan="3">Net Amount:</td>
                    <td><label>Prev Bal:</label></td>
                    <td><input type="text" readonly="readonly" value="${prevbal}" name=""/></td>
                </tr>

                <tr >
                    <td rowspan ="2" colspan="3">

                        <input type="text" readonly="readonly" value="${netbal}" name=""/></td>
                    <td><label>Paid Amt:</label></td>
                    <td><label ><input type="text" readonly="readonly" value="${paid}" name="paidamt"/></td>
                </tr>

                <tr> 
                    <td><label>Net Amt:</label></td>
                    <td><input type="text" readonly="readonly" value="${netbal}" name="blance"/></label></td>
                </tr>

            </table>


            <button  type="submit" >GET BILL</button>
            <button  id="myButton"  align="center" ><a href ="index.jsp" style="text-decoration:none; color: white">Back</a></button>
        </form>

    </body>
</html>
