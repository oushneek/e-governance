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

    public ArrayList<String> searchMedicalInfo(String national_id){
        ArrayList<String> jobInfo = new ArrayList<String>();
        jobInfo.clear();
        Connection conn = null;
        Statement stmt = null;
         try{
            //STEP 2: Register JDBC driver
            Class.forName(Connect.JDBC_DRIVER);

            //STEP 3: Open a connection
            conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "SELECT national_id,name_en,medical_id,organization_name,date,description,organization_id FROM medical natural join citizen natural join organization where national_id='"+national_id+"'";
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set

            while(rs.next()){
                  jobInfo.add(rs.getString("national_id"));
                  jobInfo.add(rs.getString("name_en"));
                  jobInfo.add(rs.getString("medical_id"));
                  jobInfo.add(rs.getString("organization_name"));
                  jobInfo.add(rs.getString("date"));
                  jobInfo.add(rs.getString("description"));
                  jobInfo.add(rs.getString("organization_id"));
            }



            rs.close();
            }catch(SQLException se){
               //Handle errors for JDBC
               se.printStackTrace();
            }catch(Exception e){
               //Handle errors for Class.forName
               e.printStackTrace();
            }
            return jobInfo;
    }    
    
     public boolean delete(String national_id,String organization_id,String medical_id){
            Connection conn = null;
            Statement stmt = null;
                 try{
                    //STEP 2: Register JDBC driver
                    Class.forName(Connect.JDBC_DRIVER);
                    //STEP 3: Open a connection
                    conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

                    //STEP 4: Execute a query
                    stmt = conn.createStatement();

                    String sql = "DELETE from medical where national_id='"+national_id+"' and organization_id='"+organization_id+"' and job_id='"+medical_id+"'";
                     
                    int what =stmt.executeUpdate(sql);
                    if(what == 1){
                        return true;
                    }
                    else{
                        return false;
                    }
     

                   
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
