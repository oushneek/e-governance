/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package database;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Tazbeea Tazakka
 */
public class Citizen {
     public int maxNationalID(String tempNationalID){
                ArrayList<String> loginDetails = new ArrayList<String>();
                Connection conn = null;
                Statement stmt = null;
                int maximumid = 0;
                 try{
                    //STEP 2: Register JDBC driver
                    Class.forName(Connect.JDBC_DRIVER);

                    //STEP 3: Open a connection
                    conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

                    //STEP 4: Execute a query
                    stmt = conn.createStatement();

                    String sql = "SELECT max(national_id) as maximum FROM citizen where national_id like '"+tempNationalID+"%' ";
                    ResultSet rs = stmt.executeQuery(sql);
                    //STEP 5: Extract data from result set
                    //String email_C = null;
                    while(rs.next()){
                       //Retrieve by column name
                        maximumid=rs.getInt("maximum");
                    }

                    rs.close();
                 }catch(SQLException se){
                    //Handle errors for JDBC
                    se.printStackTrace();
                 }catch(Exception e){
                    //Handle errors for Class.forName
                    e.printStackTrace();
                 }

                 return maximumid;
        }

}
