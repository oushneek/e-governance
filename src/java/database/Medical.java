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
public class Medical {
    public String insertMedicalInfo(ArrayList<String> info){
                Connection conn = null;
                Statement stmt = null;
                 try{
                    //STEP 2: Register JDBC driver
                    Class.forName(Connect.JDBC_DRIVER);
                    //STEP 3: Open a connection
                    conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

                    //STEP 4: Execute a query
                    stmt = conn.createStatement();

                    String sql="insert into medical(national_id,organization_id,date,description) values ('"+info.get(0)+"','"+info.get(1)+"','"+info.get(2)+"','"+info.get(3)+"')";
                    System.out.println(sql);
                     
                    stmt.executeUpdate(sql);
                    return "Done";
     

                   
                 } catch (SQLException ex) {
                      // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                     
                      return "Failed 1";
                  } 
                  catch (ClassNotFoundException ex) {
                     //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      return "Failed 2";
                  }
        }

}
