import java.sql.*;

public class Connect {

    public static void main(String[] args) {
        Connect connectObject = new Connect(); // Creating object to access our method
        connectObject.createConnection();
    }

    /**
     * Creates a connection to the MySQL server, studdibuddi
     * Creates necessary objects to execute query and then displays the results of a SELECT query
     * @author Tanner Mindrum
     * @since 3/24/2020
     */
    void createConnection() {
        try {
            // Loads MySQL driver to our program
            Class.forName("com.mysql.jdbc.Driver");

            // Establish database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://studibuddi.cvo8hcorg85o.us-west-1.rds.amazonaws.com" +
                    ":3306/studibuddi?user=" + "masterbuddi" + "&password=myMasterPass");

//            String jdbcUrl = "jdbc:postgresql://" + hostname + ":" + port + "/" + dbName + "?user=" + userName + "&password=" + password;

            // Create a Statement object
            Statement stmt = conn.createStatement();
            // Create a ResultSet object and assign it the values retrieved from a query
            String email = "hunterd98@gmail.com";
            PreparedStatement myStmt = conn.prepareStatement("DELETE FROM Post");
            //myStmt.setString(1, email);
            myStmt.executeUpdate();
            myStmt.close();
            // Print each student's ID and name
/*            if (rs.next()) {
                System.out.println(rs.first());
            }*/
            //System.out.println(rs.first());
/*            while (rs.next()) {
                System.out.println(rs.getString("bEmail"));
            }*/

            System.out.println("\n\nDatabase connection successful.");
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
