/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Harish
 */
public class dbCon {

	private static Connection conn;

	public static Connection getConn() {

		try {
			if (conn == null) {
		Class.forName("com.mysql.jdbc.Driver");
                 Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3307/daraj", "root", "");
    }

		} catch (Exception e) {

		}
            return conn;

		
	}
}

