/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.*;
import java.util.ArrayList;
import database.*;

/**
 *
 * @author Tazbeea Tazakka
 */
public class Citizen {

    public int maxNationalID(String tempNationalID) {
        Connection conn = null;
        Statement stmt = null;
        int maximumid = 0;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(Connect.JDBC_DRIVER);

            //STEP 3: Open a connection
            conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "SELECT max(national_id) as maximum FROM citizen where national_id like '" + tempNationalID + "%' ";
            ResultSet rs = stmt.executeQuery(sql);
                    //STEP 5: Extract data from result set
            //String email_C = null;
            while (rs.next()) {
                //Retrieve by column name
                maximumid = rs.getInt("maximum");
            }

            rs.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        }

        return maximumid;
    }

    public String insertCitizen(String nationalID, ArrayList<String> citizenInfo, String create_date) {
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(Connect.JDBC_DRIVER);
            //STEP 3: Open a connection
            conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "insert into citizen(national_id,name_en,name_bn,father,mother,date_of_birth,birth_place,blood_group,religion,present_address,permanent_address) values ('" + nationalID + "','" + citizenInfo.get(0) + "','" + citizenInfo.get(1) + "','" + citizenInfo.get(2) + "','" + citizenInfo.get(3) + "','" + citizenInfo.get(4) + "','" + citizenInfo.get(5) + "','" + citizenInfo.get(6) + "','" + citizenInfo.get(7) + "','" + citizenInfo.get(8) + "','" + citizenInfo.get(9) + "')";
            System.out.println(sql);

            stmt.executeUpdate(sql);
            return "Done";

        } catch (SQLException ex) {
                      // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);

            return "Failed 1";
        } catch (ClassNotFoundException ex) {
            //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
            return "Failed 2";
        }
    }

    public ArrayList<String> showcitizen() {

        Connection conn = null;
        Statement stmt = null;
        ArrayList<String> citizen = new ArrayList<String>();
        citizen.clear();
        try {
            //STEP 2: Register JDBC driver
            Class.forName(Connect.JDBC_DRIVER);

            //STEP 3: Open a connection
            conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "SELECT * FROM citizen";
            ResultSet rs = stmt.executeQuery(sql);
                    //STEP 5: Extract data from result set
            //String email_C = null;
            while (rs.next()) {
                //Retrieve by column name
                citizen.add(Integer.toString(rs.getInt("national_id")));
                citizen.add(rs.getString("name_en"));
                citizen.add(rs.getString("name_bn"));
                citizen.add(rs.getString("father"));
                citizen.add(rs.getString("mother"));
                citizen.add(rs.getString("date_of_birth"));
                citizen.add(rs.getString("birth_place"));
                citizen.add(rs.getString("blood_group"));
                citizen.add(rs.getString("religion"));
                citizen.add(rs.getString("present_address"));
                citizen.add(rs.getString("permanent_address"));

            }

            rs.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        }

        return citizen;
    }
}
