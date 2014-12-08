
package database.bank;

import database.Connect;
import database.connection.ConnectDetails;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class EditBankInfo {
     public String update(String banking_id,String national_id){
                Connection conn = null;
                Statement stmt = null;
                 try{
                    //STEP 2: Register JDBC driver
                    Class.forName(ConnectDetails.JDBC_DRIVER);
                    //STEP 3: Open a connection
                    conn = DriverManager.getConnection(ConnectDetails.DB_URL, ConnectDetails.USER, ConnectDetails.PASS);

                    //STEP 4: Execute a query
                    stmt = conn.createStatement();

                    String sql="update banking set national_id="+national_id+" where banking_id="+banking_id;
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
