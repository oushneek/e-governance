
package database.bank;

import database.Connect;
import database.connection.ConnectDetails;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Ratul
 */
public class SearchBankInfo {
    public ArrayList<String> search(String national_id){
        ArrayList<String> bankInfo = new ArrayList<String>();
        Connection conn = null;
        Statement stmt = null;
         try{
            //STEP 2: Register JDBC driver
            Class.forName(ConnectDetails.JDBC_DRIVER);

            //STEP 3: Open a connection
            conn = DriverManager.getConnection(ConnectDetails.DB_URL, ConnectDetails.USER, ConnectDetails.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "SELECT national_id,name_en,organization_name,banking_id,organization_id FROM banking natural join citizen natural join organization where national_id='"+national_id+"'";
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set

            while(rs.next()){
                  bankInfo.add(rs.getString("national_id"));
                  bankInfo.add(rs.getString("name_en"));
                  bankInfo.add(rs.getString("banking_id"));
                  bankInfo.add(rs.getString("organization_name"));
                  bankInfo.add(rs.getString("organization_id"));
            }



            rs.close();
            }catch(SQLException se){
               //Handle errors for JDBC
               se.printStackTrace();
            }catch(Exception e){
               //Handle errors for Class.forName
               e.printStackTrace();
            }
            return bankInfo;
    }
}
