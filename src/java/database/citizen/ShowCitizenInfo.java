package database.citizen;

import database.Connect;
import database.connection.ConnectDetails;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ShowCitizenInfo {

    public ArrayList<String> showcitizen() {

        Connection conn = null;
        Statement stmt = null;
        ArrayList<String> citizen = new ArrayList<String>();
        citizen.clear();
        try {
            //STEP 2: Register JDBC driver
            Class.forName(ConnectDetails.JDBC_DRIVER);

            //STEP 3: Open a connection
            conn = DriverManager.getConnection(ConnectDetails.DB_URL, ConnectDetails.USER, ConnectDetails.PASS);

            //STEP 4: Execute a query
            stmt = conn.createStatement();

            String sql = "SELECT * FROM citizen";
            ResultSet rs = stmt.executeQuery(sql);
                    //STEP 5: Extract data from result set
            //String email_C = null;
            while (rs.next()) {
                //Retrieve by column name
                citizen.add(Integer.toString(rs.getInt("national_id")));
                citizen.add(rs.getString("name_en"));
                citizen.add(rs.getString("name_bn"));
                citizen.add(rs.getString("father"));
                citizen.add(rs.getString("mother"));
                citizen.add(rs.getString("date_of_birth"));
                citizen.add(rs.getString("birth_place"));
                citizen.add(rs.getString("blood_group"));
                citizen.add(rs.getString("religion"));
                citizen.add(rs.getString("present_address"));
                citizen.add(rs.getString("permanent_address"));

            }

            rs.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        }

        return citizen;
    }
}
