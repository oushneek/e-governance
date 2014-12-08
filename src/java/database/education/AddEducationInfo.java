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
public class AddEducationInfo {
    public boolean insert(ArrayList<String> info){
                Connection conn = null;
                Statement stmt = null;
                 try{
                    //STEP 2: Register JDBC driver
                    Class.forName(ConnectDetails.JDBC_DRIVER);
                    //STEP 3: Open a connection
                    conn = DriverManager.getConnection(ConnectDetails.DB_URL, ConnectDetails.USER, ConnectDetails.PASS);

                    //STEP 4: Execute a query
                    stmt = conn.createStatement();

                    String sql="insert into education(national_id,organization_id,exam_name,year,board,cgpa) values ('"+info.get(0)+"','"+info.get(1)+"','"+info.get(2)+"','"+info.get(3)+"','"+info.get(4)+"','"+info.get(5)+"')";
                    System.out.println(sql);
                     
                    stmt.executeUpdate(sql);
                    return true;
     

                   
                 } catch (SQLException ex) {
                      // Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                     
                      return false;
                  } 
                  catch (ClassNotFoundException ex) {
                     //  Logger.getLogger(EntryForm.class.getName()).log(Level.SEVERE, null, ex);
                      return false;
                  }
        }
    
}
