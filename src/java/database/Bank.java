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
public class Bank {
    public String insertBankInfo(String organization_id,String national_id){
                Connection conn = null;
                Statement stmt = null;
                 try{
                    //STEP 2: Register JDBC driver
                    Class.forName(Connect.JDBC_DRIVER);
                    //STEP 3: Open a connection
                    conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

                    //STEP 4: Execute a query
                    stmt = conn.createStatement();

                    String sql="insert into banking(national_id,organization_id) values ('"+national_id+"','"+organization_id+"')";
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
    
    public ArrayList<String> searchBankInfo(String national_id){
        ArrayList<String> bankInfo = new ArrayList<String>();
        Connection conn = null;
        Statement stmt = null;
         try{
            //STEP 2: Register JDBC driver
            Class.forName(Connect.JDBC_DRIVER);

            //STEP 3: Open a connection
            conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

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
    
    public boolean delete(String national_id,String organization_id,String banking_id){
            Connection conn = null;
            Statement stmt = null;
                 try{
                    //STEP 2: Register JDBC driver
                    Class.forName(Connect.JDBC_DRIVER);
                    //STEP 3: Open a connection
                    conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

                    //STEP 4: Execute a query
                    stmt = conn.createStatement();

                    String sql = "DELETE from banking where national_id='"+national_id+"' and organization_id='"+organization_id+"' and banking_id='"+banking_id+"'";
                     
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

    public String editBankInfo(String banking_id,String national_id){
                Connection conn = null;
                Statement stmt = null;
                 try{
                    //STEP 2: Register JDBC driver
                    Class.forName(Connect.JDBC_DRIVER);
                    //STEP 3: Open a connection
                    conn = DriverManager.getConnection(Connect.DB_URL, Connect.USER, Connect.PASS);

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
