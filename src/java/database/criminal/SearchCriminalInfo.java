
package database.criminal;

import database.Connect;
import database.connection.ConnectDetails;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class SearchCriminalInfo {
    public ArrayList<String> search(String national_id){
        ArrayList<String> criminalInfo = new ArrayList<String>();
        Connection conn = null;
        Statement stmt = null;
         try{
            //STEP 2: Register JDBC driver
            Class.forName(ConnectDetails.JDBC_DRIVER);

            //STEP 3: Open a connection
            conn = DriverManager.getConnection(ConnectDetails.DB_URL, ConnectDetails.USER, ConnectDetails.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "select criminal_id,national_id,date,description,name_en,organization_name,organization_id from criminal natural join citizen natural join organization where national_id='"+national_id+"'";
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set

            while(rs.next()){
                  criminalInfo.add(rs.getString("national_id"));
                  criminalInfo.add(rs.getString("name_en"));
                  criminalInfo.add(rs.getString("criminal_id"));
                  criminalInfo.add(rs.getString("date"));
                  criminalInfo.add(rs.getString("description"));
                  criminalInfo.add(rs.getString("organization_name"));
                  criminalInfo.add(rs.getString("organization_id"));
            }



            rs.close();
            }catch(SQLException se){
               //Handle errors for JDBC
               se.printStackTrace();
            }catch(Exception e){
               //Handle errors for Class.forName
               e.printStackTrace();
            }
            return criminalInfo;
    } 
}
