/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Harish
 */
public class getbillser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                String cid = request.getParameter("cname");
                String bdate = request.getParameter("date");

                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/daraj", "root", "");
                System.out.println("succesfully");
                String query = "SELECT * FROM bill_detail WHERE customer_id = ? AND date = ?";
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, cid);
                statement.setString(2, bdate);

                ResultSet resultSet = statement.executeQuery();

                String paid = null;
                String oderid = null;
                String billno = null;
                String totalamt = null;
                String prevbal = null;
//             
                if (resultSet.next()) {
                    paid = resultSet.getString("paid_amt");
                    oderid = resultSet.getString("oder_id");
                    billno = resultSet.getString("bill_id");
                    totalamt = resultSet.getString("total_amt");
                    prevbal = resultSet.getString("prev_bal");

                } else {

                    System.out.println("No data found");
                }
                String query3 = "SELECT product_name FROM product_detail ;";
                Statement statement3 = connection.createStatement();
                ResultSet resultSet3 = statement3.executeQuery(query3);
                ArrayList<String> products = new ArrayList<>();
                while (resultSet3.next()) {
                    products.add(resultSet3.getString("product_name"));
                }
                String query2 = "SELECT * FROM customer_detail WHERE cust_id = ?";
                PreparedStatement statement2 = connection.prepareStatement(query2);
                statement2.setString(1, cid);
                ResultSet resultSet2 = statement2.executeQuery();
                String cname = null;
                String cadd = null;

                if (resultSet2.next()) {
                    cname = resultSet2.getString("cust_name");
                    cadd = resultSet2.getString("cust_add");
                }

                String query1 = "SELECT * FROM order_details WHERE oder_id =?";
                PreparedStatement statement1 = connection.prepareStatement(query1);
                statement1.setString(1, billno);
                ResultSet resultSet1 = statement1.executeQuery();

                String p1 = null;
                String p2 = null;
                String p3 = null;
                String p4 = null;
                String p5 = null;

                String r1 = null;
                String r2 = null;
                String r3 = null;
                String r4 = null;
                String r5 = null;

                String q1 = null;
                String q2 = null;
                String q3 = null;
                String q4 = null;
                String q5 = null;

                String pt1 = null;
                String pt2 = null;
                String pt3 = null;
                String pt4 = null;
                String pt5 = null;
                String netbal = null;

                if (resultSet1.next()) {

                    p1 = resultSet1.getString("product_1");
                    p2 = resultSet1.getString("product_2");
                    p3 = resultSet1.getString("product_3");
                    p4 = resultSet1.getString("product_4");
                    p5 = resultSet1.getString("product_5");

                    q1 = resultSet1.getString("qyt_1");
                    q2 = resultSet1.getString("qyt_2");
                    q3 = resultSet1.getString("qyt_3");
                    q4 = resultSet1.getString("qyt_4");
                    q5 = resultSet1.getString("qyt_5");

                    r1 = resultSet1.getString("price_1");
                    r2 = resultSet1.getString("price_2");
                    r3 = resultSet1.getString("price_3");
                    r4 = resultSet1.getString("price_4");
                    r5 = resultSet1.getString("price_5");

                    request.setAttribute("paid", paid);
                    request.setAttribute("oderid", oderid);
                    request.setAttribute("billno", billno);
                    request.setAttribute("totalamt", totalamt);

                    String P1 = products.get(Integer.parseInt(p1) - 1);
                    String P2 = products.get(Integer.parseInt(p2) - 1);
                    String P3 = products.get(Integer.parseInt(p3) - 1);
                    String P4 = products.get(Integer.parseInt(p4) - 1);
                    String P5 = products.get(Integer.parseInt(p5) - 1);

                    request.setAttribute("P1", P1);
                    request.setAttribute("P2", P2);
                    request.setAttribute("P3", P3);
                    request.setAttribute("P4", P4);
                    request.setAttribute("P5", P5);
                    request.setAttribute("r1", r1);
                    request.setAttribute("r2", r2);
                    request.setAttribute("r3", r3);
                    request.setAttribute("r4", r4);
                    request.setAttribute("r5", r5);
                    request.setAttribute("q1", q1);
                    request.setAttribute("q2", q2);
                    request.setAttribute("q3", q3);
                    request.setAttribute("q4", q4);
                    request.setAttribute("q5", q5);

                    pt1 = Integer.toString(Integer.parseInt(q1) * Integer.parseInt(q1));
                    pt2 = Integer.toString(Integer.parseInt(q2) * Integer.parseInt(q2));
                    pt3 = Integer.toString(Integer.parseInt(q3) * Integer.parseInt(q3));
                    pt4 = Integer.toString(Integer.parseInt(q4) * Integer.parseInt(q4));
                    pt5 = Integer.toString(Integer.parseInt(q5) * Integer.parseInt(q5));
                    netbal = Integer.toString(Integer.parseInt(prevbal) + Integer.parseInt(totalamt) - Integer.parseInt(paid));
                    request.setAttribute("pt1", pt1);
                    request.setAttribute("pt2", pt2);
                    request.setAttribute("pt3", pt3);
                    request.setAttribute("pt4", pt4);
                    request.setAttribute("pt5", pt5);
                    request.setAttribute("cname", cname);
                    request.setAttribute("cadd", cadd);
                    request.setAttribute("prevbal", prevbal);
                    request.setAttribute("netbal", netbal);

                    RequestDispatcher rd = request.getRequestDispatcher("/check.jsp");
                    rd.include(request, response);

                } else {

                    System.out.println("No data found");
                }

            } catch (Exception ex) {
                ex.printStackTrace();
                out.println(ex.getMessage());
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
