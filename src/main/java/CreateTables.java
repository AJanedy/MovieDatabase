import java.sql.SQLException;
import java.sql.Statement;

public class CreateTables {
    public static void createProductionCompanyTable(Statement statement) throws SQLException {

        String createTable = "CREATE TABLE IF NOT EXISTS production_company (" +
                             "production_company_id INT PRIMARY KEY, " +
                             "company_name VARCHAR(255) UNIQUE NOT NULL, " +
                             "year_founded INT, " +
                             "headquarters_country VARCHAR(255), " +
                             "headquarters_city VARCHAR(255)" +
                             ")";

        statement.executeUpdate(createTable);

        System.out.println("production_company table created successfully.");
    }

    public static void createMovieTable(Statement statement) throws SQLException {

        String createTable = "CREATE TABLE IF NOT EXISTS movie (" +
                             "movie_id INT PRIMARY KEY, " +
                             "title VARCHAR(255) NOT NULL, " +
                             "release_year INT, " +
                             "director_name VARCHAR(255), " +
                             "production_company_id INT, " +
                             "FOREIGN KEY (production_company_id) " +
                             "REFERENCES production_company(production_company_id)" +
                             ")";

        statement.executeUpdate(createTable);

        System.out.println("movie table created successfully.");
    }

    public static void createCastTable(Statement statement) throws SQLException {

        String createTable = "CREATE TABLE IF NOT EXISTS cast (" +
                             "cast_id INT AUTO_INCREMENT PRIMARY KEY, " +
                             "movie_id INT, " +
                             "actor_name VARCHAR(255), " +
                             "character_name VARCHAR(255), " +
                             "CONSTRAINT unique_cast UNIQUE (movie_id, actor_name, character_name), " +
                             "FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE" +
                             ")";

        statement.executeUpdate(createTable);

        System.out.println("cast table created successfully.");
    }
    public static void createRatingTable(Statement statement) throws SQLException {

        String createTable = "CREATE TABLE IF NOT EXISTS ratings (" +
                             "rating_id INT AUTO_INCREMENT PRIMARY KEY, " +
                             "movie_id INT NOT NULL, " +
                             "source VARCHAR(255), " +
                             "rating VARCHAR(255), " +
                             "top_25_rank DECIMAL(4, 1), " +
                             "FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE," +
                             "CONSTRAINT unique_rating UNIQUE (movie_id, source)" +
                             ")";

        statement.executeUpdate(createTable);

        System.out.println("ratings table created successfully.");
    }

    public static void createWebsiteTable(Statement statement) throws SQLException {

        String createTable = "CREATE TABLE IF NOT EXISTS website (" +
                             "movie_id INT PRIMARY KEY, " +
                             "imdb_url VARCHAR(255), " +
                             "metacritic_url VARCHAR(255), " +
                             "rotten_tomatoes_url VARCHAR(255), " +
                             "wikipedia_url VARCHAR(255), " +
                             "FOREIGN KEY (movie_id) REFERENCES movie(movie_id) ON DELETE CASCADE" +
                             ")";

        statement.executeUpdate(createTable);

        System.out.println("website table created successfully.");
    }
}
