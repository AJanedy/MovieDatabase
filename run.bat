@echo off

:: Compile Java files
    echo.
    echo Compiling Java files...
    javac -cp ".;./src/main/java/driver.jar" -d bin .\src\main\java\*.java
    echo Compilation was successful.
    echo.

:: Run the backend Java program
echo Running backend Java program...
java -cp ".;bin;src\main\java\driver.jar" MovieDatabase

:: Set XAMPP path to mysqldump
set XAMPP_PATH=C:\xampp\mysql\bin\mysqldump.exe

:: Verify mysqldump exists
if not exist "%XAMPP_PATH%" (
    echo mysqldump not found at "%XAMPP_PATH%". Exiting...
    pause
    exit /b 1
)

:: Export database to SQL file
echo Exporting database...
"%XAMPP_PATH%" -u root movie_ratings > "%~dp0movie_ratings.sql"
if %ERRORLEVEL% NEQ 0 (
    echo Failed to export database. Exiting...
    pause
    exit /b 1
) else (
    echo SQL file saved to "%~dp0movie_ratings.sql".
)

pause
