/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database.job;

import database.connection.ConnectDetails;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Tazbeea Tazakka
 */
public class EditJobInfo {

    public boolean edit(ArrayList<String> job) {
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(ConnectDetails.JDBC_DRIVER);
            //STEP 3: Open a connection
            conn = DriverManager.getConnection(ConnectDetails.DB_URL, ConnectDetails.USER, ConnectDetails.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "update job set national_id='" + job.get(1) + "',joining_date='" + job.get(2) + "',leaving_date='" + job.get(3) + "',post='" + job.get(4) + "'  where job_id='" + job.get(0) + "'";
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
