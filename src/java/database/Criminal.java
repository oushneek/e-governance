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
 * @author Ratul
 */
public class Criminal {

    public String insertCriminalInfo(ArrayList<String> info) {
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(Connect.JDBC_DRIVER);
            //STEP 3: Open a connection
            conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "insert into criminal(national_id,organization_id,date,description) values ('" + info.get(0) + "','" + info.get(1) + "','" + info.get(2) + "','" + info.get(3) + "')";
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

    public ArrayList<String> searchCriminalInfo(String national_id) {
        ArrayList<String> criminalInfo = new ArrayList<String>();
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(Connect.JDBC_DRIVER);

            //STEP 3: Open a connection
            conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "select criminal_id,national_id,date,description,name_en,organization_name,organization_id from criminal natural join citizen natural join organization where national_id='" + national_id + "'";
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set

            while (rs.next()) {
                criminalInfo.add(rs.getString("national_id"));
                criminalInfo.add(rs.getString("name_en"));
                criminalInfo.add(rs.getString("criminal_id"));
                criminalInfo.add(rs.getString("date"));
                criminalInfo.add(rs.getString("description"));
                criminalInfo.add(rs.getString("organization_name"));
                criminalInfo.add(rs.getString("organization_id"));
            }

            rs.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        }
        return criminalInfo;
    }

    public boolean delete(String national_id, String organization_id, String criminal_id) {
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(Connect.JDBC_DRIVER);
            //STEP 3: Open a connection
            conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "DELETE from criminal where national_id='" + national_id + "' and organization_id='" + organization_id + "' and job_id='" + criminal_id + "'";

            int what = stmt.executeUpdate(sql);
            if (what == 1) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);

            return false;
        } catch (ClassNotFoundException ex) {
            //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }

    public ArrayList<String> getCriminalInfo(String criminal_id, String national_id) {
        ArrayList<String> criminalInfo = new ArrayList<String>();
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(Connect.JDBC_DRIVER);

            //STEP 3: Open a connection
            conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "select * from criminal where national_id=" + national_id + " and criminal_id=" + criminal_id;
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set

            while (rs.next()) {
                criminalInfo.add(rs.getString("date"));
                criminalInfo.add(rs.getString("description"));

            }

            rs.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        }
        return criminalInfo;
    }

    public String editCriminalInfo(ArrayList<String> criminal) {
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(Connect.JDBC_DRIVER);
            //STEP 3: Open a connection
            conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "update criminal set national_id=" + criminal.get(0) + ",date='" + criminal.get(2) + "',description='" + criminal.get(3) + "'  where criminal_id=" + criminal.get(1);
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

}
