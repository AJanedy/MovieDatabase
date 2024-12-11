@echo off

:: Run OpenJDK installer
start /wait jdk-23_windows-x64_bin.exe

:: Create a bin directory if it doesn't exist
IF NOT EXIST bin mkdir bin

:: Find all .java files and compile them
echo.
echo Compiling Java files...
javac -cp ".;./src/main/java/driver.jar" -d bin .\src\main\java\*.java

:: Check if compilation was successful
IF %ERRORLEVEL% NEQ 0 (
    echo Compilation failed.
    echo.
    exit /b 1
) ELSE (
    echo Compilation was successful.
    echo.
)

:: Run the backend Java program
echo Running backend Java program...
java -cp ".;bin;src\main\java\driver.jar" MovieDatabase

:: Set XAMPP path to mysqldump
set XAMPP_PATH=C:\xampp\mysql\bin\mysqldump.exe

:: Determine the folder the script is running from
set SCRIPT_DIRECTORY=%~dp0

:: Run mysqldump command
"%XAMPP_PATH%" -u root movie_ratings > "%SCRIPT_DIRECTORY%movie_ratings.sql"
echo Sql file saved to root folder.
echo.

pause











