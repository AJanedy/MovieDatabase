import java.sql.SQLException;
import java.sql.Statement;

public class BuildAndEnterDatabase {
    public static void createDatabase(Statement statement, String databaseName) throws SQLException {

        // Creating movie_rating database
        statement.executeUpdate("CREATE DATABASE IF NOT EXISTS " + databaseName);
        System.out.println("Database created successfully");

        // Grant permissions.  Ensures root user has access to database.
        statement.executeUpdate("GRANT ALL PRIVILEGES ON " + databaseName +
                ".* TO 'root'@'localhost' WITH GRANT OPTION; ");
        statement.executeUpdate("FLUSH PRIVILEGES");
    }
    public static void useDatabase(Statement statement, String databaseName) throws SQLException {

        // Enter movie_rating database
        statement.executeUpdate("USE " + databaseName);
        System.out.println("Using " + databaseName);

    }
}
