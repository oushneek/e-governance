
package database.criminal;

import database.Connect;
import database.connection.ConnectDetails;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class EditCriminalInfo {
    public String update(ArrayList<String> criminal){
                Connection conn = null;
                Statement stmt = null;
                 try{
                    //STEP 2: Register JDBC driver
                    Class.forName(ConnectDetails.JDBC_DRIVER);
                    //STEP 3: Open a connection
                    conn = DriverManager.getConnection(ConnectDetails.DB_URL, ConnectDetails.USER, ConnectDetails.PASS);

                    //STEP 4: Execute a query
                    stmt = conn.createStatement();

                    String sql="update criminal set national_id="+criminal.get(0)+",date='"+criminal.get(2)+"',description='"+criminal.get(3)+"'  where criminal_id="+criminal.get(1);
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
