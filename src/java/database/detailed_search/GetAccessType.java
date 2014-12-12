/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database.detailed_search;

/**
 *
 * @author Tazbeea Tazakka
 */
import database.connection.ConnectDetails;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class GetAccessType {

    public ArrayList<String> get(String type_id) {
        ArrayList<String> accessInfo = new ArrayList<String>();
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(ConnectDetails.JDBC_DRIVER);

            //STEP 3: Open a connection
            conn = DriverManager.getConnection(ConnectDetails.DB_URL, ConnectDetails.USER, ConnectDetails.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "select * from access_type where type_id=" + type_id;
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set

            while (rs.next()) {
                // accessInfo.add(rs.getString("access_id"));
                accessInfo.add(rs.getString("access_type_id"));
            }

            rs.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        }
        return accessInfo;
    }
}
