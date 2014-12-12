/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database.bank;

import database.Connect;
import database.connection.ConnectDetails;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Tazbeea Tazakka
 */
public class AddBankInfo {

    public boolean insert(String organization_id, String national_id) {
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(ConnectDetails.JDBC_DRIVER);
            //STEP 3: Open a connection
            conn = DriverManager.getConnection(ConnectDetails.DB_URL, ConnectDetails.USER, ConnectDetails.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "insert into banking(national_id,organization_id) values ('" + national_id + "','" + organization_id + "')";
            System.out.println(sql);

            stmt.executeUpdate(sql);
            return true;

        } catch (SQLException ex) {
            // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);

            return false;
        } catch (ClassNotFoundException ex) {
            //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
