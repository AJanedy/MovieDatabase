import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

public class PopulateDatabase {

    /*
     * Statement variables used as templates for inserting data into appropriate tables
     * A PreparedStatement is an object that represents a precompiled SQL statement.
     * An SQL statement is precompiled and stored in a PreparedStatement object.
     * This object can then be used to efficiently execute this statement multiple times.
     */
    static PreparedStatement companyStatement;
    static PreparedStatement movieStatement;
    static PreparedStatement castStatement;
    static PreparedStatement ratingStatement;
    static PreparedStatement websiteStatement;
    public static void populateDatabase(Connection connection, String csvFile) throws IOException, SQLException {

        prepareSqlStatements(connection); // Initializes PreparedStatement(s)

        BufferedReader reader = new BufferedReader(new FileReader(csvFile));
        String line;
        reader.readLine(); // Skip header

        // Iterate through each line of .csv file
        while ((line = reader.readLine()) != null) {
            String[] attributes = line.split(",");
            stringFormatting(attributes); // Places necessary commas back in strings



            // Inserts unique data from each line of .csv file into appropriate table
            insertProductionCompanies(companyStatement, attributes);
            insertMovies(movieStatement, attributes);
            insertCast(castStatement, attributes);
            insertRatings(ratingStatement, attributes);
            insertWebsites(websiteStatement, attributes);
        }
        System.out.println("Database populated successfully.");

        reader.close();
        companyStatement.close();
        movieStatement.close();
        castStatement.close();
        ratingStatement.close();
        websiteStatement.close();
    }

    private static void stringFormatting(String[] attributes) {

        // Place leading "The" at the end of movie titles
        if (attributes[1].toLowerCase().startsWith("the")) {
            String modifiedMovieTitle = attributes[1].substring(4) + ", The";
            attributes[1] = modifiedMovieTitle;
        }
        // Add "," back to movie titles
        attributes[1] = attributes[1].replaceAll("/", ", ");

        // Separate multiple directors
        attributes[3] = attributes[3].replaceAll("/", ", ");

        // Format city, state
        attributes[24] = attributes[24].replaceAll("/", ", ");

        for (int i = 0; i < attributes.length; i++) {
            if (attributes[i].equals("NA")) {
                attributes[i] = null;
            }
        }
    }

    private static void prepareSqlStatements(Connection connection) throws SQLException {

        // Creating template for SQL statements, "?" will be replaced with attribute variables from .csv data
        String insertCompany = "INSERT IGNORE INTO Production_Company (production_company_id, company_name, " +
                "year_founded, headquarters_country, headquarters_city) VALUES (?, ?, ?, ?, ?)";
        String insertMovie = "INSERT IGNORE INTO Movie (movie_id, title, release_year, director_name, " +
                "production_company_id) VALUES (?, ?, ?, ?, ?)";
        String insertCast = "INSERT IGNORE INTO Cast (movie_id, actor_name, character_name) VALUES (?, ?, ?)";
        String insertRating = "INSERT IGNORE INTO Ratings (movie_id, source, rating, top_25_rank) Values (?, ?, ?, ?)";
        String insertWebsites = "INSERT IGNORE INTO Website (movie_id, imdb_url, metacritic_url, rotten_tomatoes_url, " +
                                    "wikipedia_url) VALUES (?, ?, ?, ?, ?)";

        // Initializes PreparedStatement(s)
        companyStatement = connection.prepareStatement(insertCompany);
        movieStatement = connection.prepareStatement(insertMovie);
        castStatement = connection.prepareStatement(insertCast);
        ratingStatement = connection.prepareStatement(insertRating);
        websiteStatement = connection.prepareStatement(insertWebsites);
    }

    private static void insertProductionCompanies(PreparedStatement companyStatement, String[] attributes) throws SQLException {

        // Insert production companies into table
        companyStatement.setInt(1, Integer.parseInt(attributes[20])); // company_id
        companyStatement.setString(2, attributes[21]); // company_name
        if (attributes[22] == null) {
            companyStatement.setNull(3, Types.INTEGER); // year_founded unknown
        } else {
            companyStatement.setInt(3, Integer.parseInt(attributes[22])); // year_founded
        }
        if (attributes[23] == null) {
            companyStatement.setNull(4, Types.VARCHAR); // headquarters_country unknown
        } else {
            companyStatement.setString(4, attributes[23]); // headquarters_country
        }
        if (attributes[24] == null) {
            companyStatement.setNull(5, Types.VARCHAR); // headquarters_city unknown
        } else {
            companyStatement.setString(5, attributes[24]); // headquarters_city
        }
        companyStatement.executeUpdate();
    }
    private static void insertMovies(PreparedStatement movieStatement, String[] attributes) throws SQLException {

        // Insert movies into table
        movieStatement.setInt(1, Integer.parseInt(attributes[0])); // movie_id
        movieStatement.setString(2, attributes[1]); // movie_title
        movieStatement.setInt(3, Integer.parseInt(attributes[2])); // release_year
        movieStatement.setString(4, attributes[3]); // director
        movieStatement.setInt(5, Integer.parseInt(attributes[20])); // production_company_id
        movieStatement.executeUpdate();
    }
    private static void insertCast(PreparedStatement castStatement, String[] attributes) throws SQLException {

        // Insert cast into table
        for (int i = 10; i < 20; i+=2) {
            castStatement.setInt(1, Integer.parseInt(attributes[0])); // movie_id
            castStatement.setString(2, attributes[i]); // actor
            castStatement.setString(3, attributes[i+1]); // character
            castStatement.executeUpdate();
        }
    }
    private static void insertRatings(PreparedStatement ratingStatement, String[] attributes) throws SQLException {

        // Insert ratings into table
        for (int i = 4; i < 10; i += 2) {
            String source;
            if (i == 4) {
                source = "IMDb";
            }
            else if (i == 6) {
                source = "Metacritic";
            }
            else {
                source = "Rotten Tomatoes";
            }
            ratingStatement.setInt(1, Integer.parseInt(attributes[0])); // movie_id
            ratingStatement.setString(2, source); // review_site
            if (attributes[i] == null) {
                ratingStatement.setNull(3, Types.FLOAT); // movie_rating does not exist
            } else {
                ratingStatement.setFloat(3, Float.parseFloat(attributes[i])); // movie_rating
            }
            if (attributes[i+1] == null) {
                ratingStatement.setNull(4, Types.INTEGER); // movie_rank does not exist
            } else {
                ratingStatement.setInt(4, Integer.parseInt(attributes[i+1])); // top_25_rank
            }
            ratingStatement.executeUpdate();
        }
    }
    private static void insertWebsites(PreparedStatement movieStatement, String[] attributes) throws SQLException {
        // Insert websites into table
        movieStatement.setInt(1, Integer.parseInt(attributes[0])); // movie_id
        movieStatement.setString(2, attributes[25]); // imdb_url
        movieStatement.setString(3, (attributes[26])); // metacritic_url
        movieStatement.setString(4, attributes[27]); // rotten_tomatoes_url
        movieStatement.setString(5, attributes[28]); // wikipedia_url
        movieStatement.executeUpdate();
    }

}
