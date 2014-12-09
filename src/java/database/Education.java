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
public class Education {

    public String insertEducationInfo(ArrayList<String> info) {
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(Connect.JDBC_DRIVER);
            //STEP 3: Open a connection
            conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "insert into education(national_id,organization_id,exam_name,year,board,cgpa) values ('" + info.get(0) + "','" + info.get(1) + "','" + info.get(2) + "','" + info.get(3) + "','" + info.get(4) + "','" + info.get(5) + "')";
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

    public ArrayList<String> searchEducationInfo(String national_id) {
        ArrayList<String> educationInfo = new ArrayList<String>();
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(Connect.JDBC_DRIVER);

            //STEP 3: Open a connection
            conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

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

    public boolean delete(String national_id, String organization_id, String education_id) {
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(Connect.JDBC_DRIVER);
            //STEP 3: Open a connection
            conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "DELETE from education where national_id='" + national_id + "' and organization_id='" + organization_id + "' and education_id='" + education_id + "'";

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

    public ArrayList<String> getEducationInfo(String education_id, String national_id) {
        ArrayList<String> educationInfo = new ArrayList<String>();
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(Connect.JDBC_DRIVER);

            //STEP 3: Open a connection
            conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "select * from education where national_id=" + national_id + " and education_id=" + education_id;
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set

            while (rs.next()) {
                educationInfo.add(rs.getString("exam_name"));
                educationInfo.add(rs.getString("board"));
                educationInfo.add(rs.getString("year"));
                educationInfo.add(rs.getString("cgpa"));

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

    public String editEducationInfo(ArrayList<String> education) {
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 2: Register JDBC driver
            Class.forName(Connect.JDBC_DRIVER);
            //STEP 3: Open a connection
            conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "update education set national_id='" + education.get(1) + "',exam_name='" + education.get(2) + "',board='" + education.get(3) + "' ,year='" + education.get(4) + "' ,cgpa='" + education.get(5) + "'  where education_id='" + education.get(0) + "'";
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
