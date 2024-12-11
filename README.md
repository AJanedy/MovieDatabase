                                  Movie Database
========================================================================================
An application for connecting to MySQL via Xampp relational database management system.
The program will make a connection to the SQL server, after which it will read in a
provided .csv file and use that information to create and populate a database 
"movie_ratings". The program will then save the associated .sql file in the root 
directory of this program.
========================================================================================

                                   Requirements
========================================================================================
Java Development Kit (JDK) Version 20 (or higher)
Apache Maven 3.6 (or higher)
MySQL (5.x or higher)
XAMPP installed in root directory (C:\\xampp) and an instance of Xampp MySQL active
========================================================================================

                                   Instructions
========================================================================================
Windows using Command Prompt/PowerShell: Make sure you have MySQL running in XAMPP. 
Navigate to root folder of project and run command ".\run.bat". Alternatively, locate
the run.bat file in the project folder and double click to run. To delete the SQL 
database that was just created, while MySql is running, in the root directory run 
".\delete.bat". You can also locate the delete.bat file in the project folder and 
double click to run.

Mac using Terminal/Windows using Bash emulator such as Git Bash: Make sure you 
have MySql running in XAMPP. Navigate to the root folder. If using a Mac, run
commands "chmod +x run.sh" and "chmod +x delete.sh". On either system, now run 
"./run.sh". To delete the SQL database that was just created, while MySQL is running, 
in the root directory, run "./delete.sh".
========================================================================================

                                Accessing Database
========================================================================================
Windows: On XAMPP, while MySQL is running, find the "Shell" button on the right hand 
side.  Select this, and in the window that appears, type "mysql -u root", you can now
access the database using standard syntax.

Mac: In Terminal while MySQL is running in XAMPP, type 
"/Applications/XAMPP/xamppfiles/bin/mysql -u root -", you can now access the database
using standard syntax.


