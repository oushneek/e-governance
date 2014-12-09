/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database.education;

import database.connection.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Tazbeea Tazakka
 */
public class SearchEducationInfo {

    public ArrayList<String> search(String national_id) {
        ArrayList<String> educationInfo = new ArrayList<String>();
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(ConnectDetails.JDBC_DRIVER);

            //STEP 3: Open a connection
            conn = DriverManager.getConnection(ConnectDetails.DB_URL, ConnectDetails.USER, ConnectDetails.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "select education_id,national_id,exam_name,year,board,cgpa,name_en,organization_name,organization_id from education natural join citizen natural join organization where national_id='" + national_id + "'";
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set

            while (rs.next()) {
                educationInfo.add(rs.getString("national_id"));
                educationInfo.add(rs.getString("name_en"));
                educationInfo.add(rs.getString("education_id"));
                educationInfo.add(rs.getString("exam_name"));
                educationInfo.add(rs.getString("year"));
                educationInfo.add(rs.getString("board"));
                educationInfo.add(rs.getString("cgpa"));
                educationInfo.add(rs.getString("organization_name"));
                educationInfo.add(rs.getString("organization_id"));
            }

            rs.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        }
        return educationInfo;
    }

}
