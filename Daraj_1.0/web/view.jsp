<%-- 
    Document   : createbill
    Created on : Jun 7, 2023, 10:09:39 PM
    Author     : Harish
--%>





<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--link rel="stylesheet" href="style.css"-->
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
        <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>


    </head>

    <body>

        <!--       java code for dynamic  customer name using select option -->
        <%@ page import="java.sql.*, javax.servlet.*" %>
        <%@page import="java.sql.DriverManager"%>
        <%@page import="java.sql.PreparedStatement"%>
        <%@page import="java.sql.Connection"%>
        <%@page import="java.time.LocalDate"%>
        <%@page import="java.time.format.DateTimeFormatter"%>


        <%
            LocalDate date1 = LocalDate.now();
            DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy ");
            String date = date1.format(myFormatObj);
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

            String paid1 = request.getParameter("paidamt");
            String totalp1 = request.getParameter("totalp1");
            String totalp2 = request.getParameter("totalp2");
            String totalp3 = request.getParameter("totalp3");
            String totalp4 = request.getParameter("totalp4");
            String totalp5 = request.getParameter("totalp5");
            String totalamt = request.getParameter("totalamt");
            String totalqt = request.getParameter("totalqt");
            String custid = request.getParameter("cname");

            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/daraj", "root", "");
            System.out.println("succesfully");
            String query = "SELECT cust_name ,blance_amt,cust_add FROM customer_detail where cust_id = " + custid;
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            String CustomerName = null;
            String CustomerAdd = null;
            String CustBlance = null;
            while (resultSet.next()) {
                CustomerName = resultSet.getString("cust_name");
                CustomerAdd = resultSet.getString("cust_add");
                CustBlance = resultSet.getString("blance_amt");
            }
            String query1 = "SELECT bill_id FROM bill_detail;";
            Statement statement1 = connection.createStatement();
            ResultSet resultSet1 = statement1.executeQuery(query1);
            String billno = null;

            while (resultSet1.next()) {
                billno = resultSet1.getString("bill_id");
            }

            String query2 = "SELECT product_name FROM product_detail ;";
            Statement statement2 = connection.createStatement();
            ResultSet resultSet2 = statement2.executeQuery(query2);
            ArrayList<String> products = new ArrayList<>();
            while (resultSet2.next()) {
                products.add(resultSet2.getString("product_name"));
            }


        %>



        <div id="form2">
            <form action="db.jsp"  method="post" style="width: 800px; margin: 0 auto; background-color: #fff; padding: 30px; border: 1px solid #ccc;">
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
                        <td colspan="2" id="nobd"><select name="cname">
                                <option value="<%=custid%>"><%=CustomerName%></option>
                            </select></td>
                        <td id="nobd"><label>Bill No:</label> </td>
                        <td  id="nobd"><input type="text" readonly="readonly" value="<%=(Integer.parseInt(billno) + 1)%>" name="bill_no"/></td>
                    </tr>
                    <tr>
                        <td id="nobd"><label>Add:</label></td>
                        <td  id="nobd" colspan="2"><input type="text" readonly="readonly" value="<%=CustomerAdd%>" name=""/></td>
                        <td id="nobd"><label>Date:</label> </td>
                        <td id="nobd"><input type="text" readonly="readonly" value="<%=date%>" name="date"/></td>
                    </tr>
                    <tr>
                        <td>Item</td>
                        <td colspan="2">Qty/Net.Wt.</td>
                        <td>Rate</td>
                        <td>Amount</td>

                    </tr>
                    <tr>
                        <td><select name="p1">
                                <option value="<%=p1%>"><%=products.get(Integer.parseInt(p1) - 1)%></option>
                            </select ></td>
                        <td colspan="2"><input type="text" readonly="readonly" value="<%=q1%>" name="q1"/></td>
                        <td><input type="text" readonly="readonly" value="<%=r1%>" name="r1"/></td>
                        <td><input type="text" readonly="readonly" value="<%=totalp1%>" name=""/></td>
                    </tr>

                    <tr>
                        <td><select name="p2">
                                <option value="<%=p2%>"><%=products.get(Integer.parseInt(p2) - 1)%></option>
                            </select >

                            </select></td>
                        <td colspan="2"><input type="text" readonly="readonly" value="<%=q2%>" name="q2"/></td>
                        <td><input type="text" readonly="readonly" value="<%=r2%>" name="r2"/></td>
                        <td><input type="text" readonly="readonly" value="<%=totalp2%>" name=""/></td>
                    </tr>

                    <tr>
                        <td><select name="p3">
                                <option value="<%=p3%>"><%=products.get(Integer.parseInt(p3) - 1)%></option>
                            </select ></td>
                        <td colspan="2"><input type="text" readonly="readonly" value="<%=q3%>" name="q3"/></td>
                        <td><input type="text" readonly="readonly" value="<%=r3%>" name="r3"/></td>
                        <td><input type="text" readonly="readonly" value="<%=totalp3%>" name=""/></td>
                    </tr>
                    <tr>
                        <td><select name="p4">
                                <option value="<%=p4%>"><%=products.get(Integer.parseInt(p4) - 1)%></option>
                            </select ></td>
                        <td colspan="2"><input type="text" readonly="readonly" value="<%=q4%>" name="q4"/></td>
                        <td><input type="text" readonly="readonly" value="<%=r4%>" name="r4"/></td>
                        <td><input type="text" readonly="readonly" value="<%=totalp4%>" name=""/></td>
                    </tr>

                    <tr>
                        <td><select name="p5">
                                <option value="<%=p5%>"><%=products.get(Integer.parseInt(p5) - 1)%></option>
                            </select ></td>
                        <td colspan="2"><input type="text" readonly="readonly" value="<%=q5%>" name="q5"/></td>
                        <td><input type="text" readonly="readonly" value="<%=r5%>" name="r5"/></td>
                        <td><input type="text" readonly="readonly" value="<%=totalp5%>" name=""/></td>
                    </tr>

                    <tr>
                        <td>Total</td>
                        <td colspan="2"><input type="text" readonly="readonly" value="<%=totalqt%>" name=""/></td>
                        <td><label >Amount :</label></td>
                        <td><input type="text" readonly="readonly" value="<%=totalamt%>" name="totalamt"/></td>
                    </tr>

                    <tr >
                        <td  colspan="3">Net Amount:</td>
                        <td><label>Prev Bal:</label></td>
                        <td><input type="text" readonly="readonly" value="<%=CustBlance%>" name="CustBlance"/></td>
                    </tr>

                    <tr >
                        <td rowspan ="2" colspan="3">
                            <%String blance = String.valueOf(Integer.parseInt(CustBlance) - Integer.parseInt(paid1) + Integer.parseInt(totalamt));%>
                            <input type="text" readonly="readonly" value="<%=blance%>" name=""/></td>
                        <td><label>Paid Amt:</label></td>
                        <td><label ><input type="text" readonly="readonly" value="<%=paid1%>" name="paidamt"/></td>
                    </tr>

                    <tr> 
                        <td><label>Net Amt:</label></td>
                        <td><input type="text" readonly="readonly" value="<%=blance%>" name="blance"/></label></td>
                    </tr>

                </table>


                <button  type="submit"  >Submit</button>
                <button  id="myButton"  align="center" ><a href ="index.jsp" style="text-decoration:none; color: white">Back</a></button>



            </form>
                    
            <a download onClick="takeAPicture()"><button>print</button></a>

        </div>
        

        <script>
            function takeAPicture() {
                // Get the reference to the div element
                let divElement = document.getElementById('form2');

                // Use html2canvas to capture the div as an image
                html2canvas(divElement).then(function (canvas) {
                    // Convert the canvas to a data URL
                    let dataUrl = canvas.toDataURL('image/png');

                    // Create a temporary link element
                    let link = document.createElement('a');
                    link.href = dataUrl;
                    link.download = '<%=CustomerName%>_bill_<%=date%>.png'; // Set the filename for the downloaded image

                    // Trigger the click event on the link element
                    link.click();
                });
            }
        </script>


    </body>
</html>




