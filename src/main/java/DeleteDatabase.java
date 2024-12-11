
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class DeleteDatabase {
    public static void deleteDatabase() throws SQLException, ClassNotFoundException {

        String url = "jdbc:mysql://localhost:3306/"; // Local address to connect Java with MySQL
        String username = "root"; // Default SQL username
        String password = ""; // Default SQL password
        String databaseName = "movie_ratings"; // Desired SQL database name

        Class.forName("com.mysql.cj.jdbc.Driver");
        // Create connection to SQL database:
        try (Connection connection = DriverManager.getConnection(url, username, password)) {

            // Create an SQL statement object (used for executing an SQL statement)
            try (Statement statement = connection.createStatement()) {

                String[] deleteQuery =
                        {"USE movie_ratings; ",
                                "SET FOREIGN_KEY_CHECKS = 0; ",
                                "DROP TABLE cast; ",
                                "DROP TABLE movie; ",
                                "DROP TABLE ratings; ",
                                "DROP TABLE website; ",
                                "DROP TABLE production_company; ",
                                "SET FOREIGN_KEY_CHECKS = 1; ",
                                "DROP DATABASE movie_ratings; "};

                for (String query : deleteQuery) {
                    statement.executeUpdate(query);
                }

            } catch (SQLException e) {
                System.out.println("Failed to delete database: " + e.getMessage());
            }
        } catch (SQLException e) {
            System.out.println("Error connecting to database: " + e.getMessage());
        }
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        deleteDatabase();
    }
}



