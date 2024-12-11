import java.sql.SQLException;
import java.sql.Statement;

public class BuildAndEnterDatabase {
    public static void createDatabase(Statement statement, String databaseName) throws SQLException {

        // Creating movie_rating database
        statement.executeUpdate("CREATE DATABASE IF NOT EXISTS " + databaseName);
        System.out.println("Database created successfully");
    }
    public static void useDatabase(Statement statement, String databaseName) throws SQLException {

        // Enter movie_rating database
        statement.executeUpdate("USE " + databaseName);
        System.out.println("Using " + databaseName);

    }
}