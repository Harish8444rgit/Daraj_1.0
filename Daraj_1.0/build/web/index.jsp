<%-- 
    Document   : validate
    Created on : Jun 8, 2023, 8:19:38 PM
    Author     : Harish
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="style.css">

        <title> Daraj 1.0</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        form {
            width: 95%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ccc;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
            text-align: left;
        }

        #heading {
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        select,
        input[type="number"] {
            padding: 5px;
            width: 90%;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 14px;
        }

        button {
            margin-top: 10px;
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        a {
            color: white;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        /* Responsive Styles */
        @media (max-width: 767px) {
            form {
                padding: 10px;
            }

            table {
                font-size: 12px;
            }

            th,
            td {
                padding: 5px;
            }
        }

        @media (max-width: 480px) {
            form {
                padding: 5px;
            }

            table {
                font-size: 10px;
            }

            th,
            td {
                padding: 2px;
            }
        }
    </style>
        </head>
        <body>

            <!--       java code for dynamic  customer name using select option -->
            <%@ page import="java.sql.*, javax.servlet.*" %>
            <%@page import="java.sql.DriverManager"%>
            <%@page import="java.sql.PreparedStatement"%>
            <%@page import="java.sql.Connection"%>
            <%@page import="java.time.LocalDate"%>
            <%@page import="java.time.format.DateTimeFormatter"%>
            <%@ page import="javax.servlet.RequestDispatcher" %>

            <%
                LocalDate date1 = LocalDate.now();
                DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy ");
                String date = date1.format(myFormatObj);
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/daraj", "root", "");
                System.out.println("succesfully");
                String query = "SELECT cust_id, cust_name ,cust_add FROM customer_detail";
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(query);

                // Create a StringBuilder to store the options HTML
                StringBuilder optionsHtml1 = new StringBuilder();

                // Iterate over the product data and generate the dropdown options
                while (resultSet.next()) {
                    String CustomerId = resultSet.getString("cust_id");
                    String CustomerName = resultSet.getString("cust_name");
                    String CustomerAdd = resultSet.getString("cust_add");
                    optionsHtml1.append("<option value=\"").append(CustomerId).append("\">")
                            .append(CustomerName).append("</option>");
                }

                String query2 = "SELECT prod_id, product_name FROM product_detail";
                Statement statement2 = connection.createStatement();
                ResultSet resultSet2 = statement2.executeQuery(query2);
                StringBuilder optionsHtml2 = new StringBuilder();

                while (resultSet2.next()) {
                    String ProductId = resultSet2.getString("prod_id");
                    String ProductName = resultSet2.getString("product_name");
                    optionsHtml2.append("<option value=\"").append(ProductId).append("\">")
                            .append(ProductName).append("</option>");
                }

                // Close the database connection and statement
                resultSet.close();
                statement.close();

                // Execute a query to fetch the product data

            %>


            <form action="view.jsp" method="post" >
                <table border="2">
                    <tr  rowspan="5" align="center">
                        <th colspan="5" id="heading"> YADAV BORTHER'S CHILLI<br>
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
                    <td id="nobd"><label>Date:</label> </td>
                    <td id="nobd" ><%=date%></td>

                </tr>

                <tr>
                    <td>Item</td>
                    <td colspan="2">Qty/Net.Wt.</td>
                    <td>Rate</td>
                    <td>Amount</td>

                </tr>
                <tr><td><select name="p1">
                            <!--product1-->
                            <%= optionsHtml2.toString()%>
                        </select ></td>
                    <td colspan="2"><input type="number" name="q1" value="0" id="q1" onkeyup="showsum()"></td>
                    <td><input type="number" name="r1" value="0" id="r1" onkeyup="showsum()" ></td>
                    <td><input type="number" id="total1"  name = "totalp1" value="0"> </td>
                </tr>
                <tr>
                    <td><select name="p2">
                            <!--product2-->
                            <%= optionsHtml2.toString()%>
                        </select></td>
                    <td colspan="2"><input type="number"  name="q2" value="0" id="q2" onkeyup="showsum()"></td>
                    <td><input type="number" name="r2" value="0" id="r2" onkeyup="showsum()"></td>
                    <td><input type="number"name="totalp2" id="total2" value="0">

                    </td>
                </tr>
                <tr>
                    <td><select name="p3">
                            <!--product3-->
                            <%= optionsHtml2.toString()%>
                        </select></td>
                    <td colspan="2"><input type="number" name="q3" value="0" id="q3"onkeyup="showsum()"></td>
                    <td><input type="number" name="r3" value="0" id="r3"onkeyup="showsum()"></td>
                    <td><input type="number"name="totalp3" id="total3" value="0">

                    </td>
                </tr>
                <tr>
                    <td><select name="p4">
                            <!--product4-->
                            <%= optionsHtml2.toString()%>
                        </select></td>
                    <td colspan="2"><input type="number" name="q4" value="0" id="q4"onkeyup="showsum()"></td>
                    <td><input type="number" name="r4" value="0" id="r4"onkeyup="showsum()"></td>
                    <td><input type="number"name="totalp4"  id="total4"value="0">

                    </td>
                </tr>
                <tr>
                    <td><select name="p5">
                            <!--product4-->
                            <%= optionsHtml2.toString()%>
                        </select></td>
                    <td colspan="2"><input type="number" name="q5" value="0" id="q5"onkeyup="showsum()"></td>
                    <td><input type="number" name="r5"value="0" id="r5"onkeyup="showsum()"></td>
                    <td>
                        <input type="number"name="totalp5" id="total5"value="0">

                    </td>
                </tr>
                <tr>
                    <td>Total</td>
                    <td colspan="2"><input type="number" name="totalqt"id="totalqt" value="0"></td>

                    <td><label >Amount :</label></td>
                    <td><input type="number" name="totalamt" id="totalamt" value="0"></td>

                </tr>
                <tr >
                    <td  colspan="3">Paid Amt.:</td>
                    <td colspan="2"><input type="number" name="paidamt" id="paid" value="0"></td>   
                </tr>

            </table>
            <button type="submit" >Confirm</button>
            <button type="reset" >Reset</button>
            <button type="button" ><a href ="cust_add.jsp" style="text-decoration:none; color: white">Add Customer</a></button>
            <button type="button" ><a href ="addproduct.jsp" style="text-decoration:none; color: white">Add Product</a></button>
            <button type="button" ><a href ="check.jsp" style="text-decoration:none; color: white">Invoice</a></button>
        </form>



        <script>
            var text1 = document.getElementById("q1");
            var text2 = document.getElementById("r1");
            var text3 = document.getElementById("q2");
            var text4 = document.getElementById("r2");
            var text5 = document.getElementById("q3");
            var text6 = document.getElementById("r3");
            var text7 = document.getElementById("q4");
            var text8 = document.getElementById("r4");
            var text9 = document.getElementById("q5");
            var text10 = document.getElementById("r5");

            function showsum() {
                var f1 = parseFloat(text1.value);
                if (isNaN(f1))
                    f1 = 0;
                var f2 = parseFloat(text2.value);
                if (isNaN(f2))
                    f2 = 0;

                var f3 = parseFloat(text3.value);
                if (isNaN(f3))
                    f3 = 0;
                var f4 = parseFloat(text4.value);
                if (isNaN(f4))
                    f4 = 0;

                var f5 = parseFloat(text5.value);
                if (isNaN(f5))
                    f5 = 0;
                var f6 = parseFloat(text6.value);
                if (isNaN(f6))
                    f6 = 0;

                var f7 = parseFloat(text7.value);
                if (isNaN(f7))
                    f7 = 0;
                var f8 = parseFloat(text8.value);
                if (isNaN(f8))
                    f8 = 0;

                var f9 = parseFloat(text9.value);
                if (isNaN(f9))
                    f9 = 0;
                var f10 = parseFloat(text10.value);
                if (isNaN(f10))
                    f10 = 0;

                var result1 = f1 * f2;
                var result2 = f3 * f4;
                var result3 = f5 * f6;
                var result4 = f7 * f8;
                var result5 = f9 * f10;
                var totalamt1 = result1 + result2 + result3 + result4 + result5;
                var totalqt1 = f1 + f3 + f5 + f7 + f9;
                document.getElementById("total1").value = result1;
                document.getElementById("total2").value = result2;
                document.getElementById("total3").value = result3;
                document.getElementById("total4").value = result4;
                document.getElementById("total5").value = result5;
                document.getElementById("totalamt").value = totalamt1;
                document.getElementById("totalqt").value = totalqt1;
            }
        </script>


    </body>
</html>