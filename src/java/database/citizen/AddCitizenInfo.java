
package database.citizen;

import database.Connect;
import database.connection.ConnectDetails;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class AddCitizenInfo {
    public String insert(String nationalID,ArrayList<String> citizenInfo,String create_date){
                Connection conn = null;
                Statement stmt = null;
                 try{
                    //STEP 2: Register JDBC driver
                    Class.forName(ConnectDetails.JDBC_DRIVER);
                    //STEP 3: Open a connection
                    conn = DriverManager.getConnection(ConnectDetails.DB_URL, ConnectDetails.USER, ConnectDetails.PASS);

                    //STEP 4: Execute a query
                    stmt = conn.createStatement();

                    String sql="insert into citizen(national_id,name_en,name_bn,father,mother,date_of_birth,birth_place,blood_group,religion,present_address,permanent_address) values ('"+nationalID+"','"+citizenInfo.get(0)+"','"+citizenInfo.get(1)+"','"+citizenInfo.get(2)+"','"+citizenInfo.get(3)+"','"+citizenInfo.get(4)+"','"+citizenInfo.get(5)+"','"+citizenInfo.get(6)+"','"+citizenInfo.get(7)+"','"+citizenInfo.get(8)+"','"+citizenInfo.get(9)+"')";
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
