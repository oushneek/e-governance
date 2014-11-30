
package database;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;



public class Login {
    
    public boolean loginCheck(String email,String pass){
       Connection conn = null;
       Statement stmt = null;
       boolean decision= false;
        try{
           //STEP 2: Register JDBC driver
           Class.forName(Connect.JDBC_DRIVER);

           //STEP 3: Open a connection
           conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

           //STEP 4: Execute a query
           stmt = conn.createStatement();

           String sql = "SELECT * FROM organization natural join type where email='"+email+"' and password='"+pass+"'";
           ResultSet rs = stmt.executeQuery(sql);
           //STEP 5: Extract data from result set
           String email_C = null;
           while(rs.next()){
              //Retrieve by column name
              email_C = rs.getString("email");
           }

           if(email.equals(email_C)){
               decision = true;
           }
           else{
               decision = false;
           }

           rs.close();
        }catch(SQLException se){
           //Handle errors for JDBC
           se.printStackTrace();
        }catch(Exception e){
           //Handle errors for Class.forName
           e.printStackTrace();
        }
        
        return decision;
        }
    
        public ArrayList<String> loginDetails(String email,String pass){
                ArrayList<String> loginDetails = new ArrayList<String>();
                Connection conn = null;
                Statement stmt = null;
                boolean decision= false;
                 try{
                    //STEP 2: Register JDBC driver
                    Class.forName(Connect.JDBC_DRIVER);

                    //STEP 3: Open a connection
                    conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

                    //STEP 4: Execute a query
                    stmt = conn.createStatement();

                    String sql = "SELECT * FROM organization natural join type where email='"+email+"' and password='"+pass+"'";
                    ResultSet rs = stmt.executeQuery(sql);
                    //STEP 5: Extract data from result set
                    String email_C = null;
                    while(rs.next()){
                       //Retrieve by column name
                       loginDetails.add(rs.getString("type_id"));
                       loginDetails.add(rs.getString("organization_id"));
                       loginDetails.add(rs.getString("organization_name"));
                       loginDetails.add(rs.getString("email"));
                    }

                    rs.close();
                 }catch(SQLException se){
                    //Handle errors for JDBC
                    se.printStackTrace();
                 }catch(Exception e){
                    //Handle errors for Class.forName
                    e.printStackTrace();
                 }

                 return loginDetails;
        }
    
    
}
