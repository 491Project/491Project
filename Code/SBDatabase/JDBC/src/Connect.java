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

            // Create a Statement object
            Statement stmt = conn.createStatement();
            // Create a ResultSet object and assign it the values retrieved from a query
            ResultSet rs = stmt.executeQuery("SELECT * FROM TestTable");
            // Print each student's ID and name
            while (rs.next()) {
                System.out.println("ID: " + rs.getInt("studentID") + "\nName: " +
                        rs.getString("studentName") + "\n");
            }

            System.out.println("\n\nDatabase connection successful.");
        }
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
