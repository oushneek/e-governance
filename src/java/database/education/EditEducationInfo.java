/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database.education;

import database.connection.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Tazbeea Tazakka
 */
public class EditEducationInfo {

    public boolean edit(ArrayList<String> education) {
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(ConnectDetails.JDBC_DRIVER);
            //STEP 3: Open a connection
            conn = DriverManager.getConnection(ConnectDetails.DB_URL, ConnectDetails.USER, ConnectDetails.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "update education set national_id='" + education.get(1) + "',exam_name='" + education.get(2) + "',board='" + education.get(3) + "' ,year='" + education.get(4) + "' ,cgpa='" + education.get(5) + "'  where education_id='" + education.get(0) + "'";
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
