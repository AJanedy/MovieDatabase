import java.io.IOException;
import java.sql.*;  // Provides the API for accessing and processing data stored in a data source

public class MovieDatabase {
    static String url = "jdbc:mysql://localhost:3306/"; // Local address to connect Java with MySQL
    static String username = "root"; // Default SQL username
    static String password = ""; // Default SQL password
    static String databaseName = "movie_ratings"; // Desired SQL database name
    static String filename = "MovieRatings.csv"; // Name of .csv file used to populate database
    public static void main(String[] args) throws ClassNotFoundException {

        // load and register JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Create connection to SQL database:
        try (Connection connection = DriverManager.getConnection(url, username, password)) {

            // Create an SQL statement object (used for executing an SQL statement)
            try (Statement statement = connection.createStatement()) {

                // Create and enter database
                BuildAndEnterDatabase buildAndUse = new BuildAndEnterDatabase();
                buildAndUse.createDatabase(statement, databaseName);
                buildAndUse.useDatabase(statement, databaseName);

                // Create table schema
                CreateTables createTables = new CreateTables();
                createTables.createProductionCompanyTable(statement);
                createTables.createMovieTable(statement);
                createTables.createCastTable(statement);
                createTables.createRatingTable(statement);
                createTables.createWebsiteTable(statement);

                // Populate database
                PopulateDatabase populateDatabase = new PopulateDatabase();
                populateDatabase.populateDatabase(connection, filename);

            } catch (SQLException e) {
                System.out.println("Failed to create database: " + e.getMessage());
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } catch (SQLException e) {
            System.out.println("Error connecting to database: " + e.getMessage());
        }
    }
}