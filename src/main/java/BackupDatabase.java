import java.io.*;

public class BackupDatabase {

    public static void backupDatabase() {

        String command = "mysqldump -u root -p movie_ratings";

        try {
            // Setup process to execute mysqldump
            ProcessBuilder processBuilder = new ProcessBuilder(command.split(" "));

            // Output file path set to source folder
            File backupFile = new File("src/movie_ratings.sql");
            processBuilder.redirectOutput(backupFile);

            // Start process
            Process process = processBuilder.start();
            process.waitFor();

            System.out.println("Database backed up to " + backupFile.getAbsolutePath());
        } catch (IOException | InterruptedException e) {
            System.out.println("Error backing up database: " + e.getMessage());
        }
    }
}
