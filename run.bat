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
"%XAMPP_PATH%" -u root movie_ratings > "%~dp0MovieRatingsWebsite\movie_ratings_MySql.sql"
if %ERRORLEVEL% NEQ 0 (
    echo Failed to export database. Exiting...
    pause
    exit /b 1
) else (
    echo SQL file saved to "%~dp0\MovieRatingsWebsite\movie_ratingsMySql.sql".
)

:: Start website and open browser
cd MovieRatingsWebsite
:: Starts npm in background
start /B npm start > nul 2>&1
:: Launch website
echo Launching the Movie Ratings Website
start http://localhost:3000
cd ..

echo Press any key to terminate the program and free the port
pause > nul

:: Find and kill the node process on port 3000
netstat -ano | findstr :3000 > nul
for /f "tokens=5" %%a in ('netstat -ano ^| findstr :3000') do set PID=%%a
start /B powershell Stop-Process -Id %PID% -Force

echo Thank you for using the Movie Database Website :)
pause > nul