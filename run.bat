@echo off

:: Create a bin directory if it doesn't exist
IF NOT EXIST bin mkdir bin

@REM :: Clean out the directory if it already does
@REM IF EXIST bin rmdir /s /q bin
@REM ::mkdir bin

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

@REM REM Check if the frontend directory exists and run the frontend if present
@REM IF EXIST frontend (
@REM     echo Running frontend...
@REM
@REM     REM Change to the frontend directory
@REM     cd frontend
@REM
@REM     REM Install frontend dependencies using npm
@REM     npm install
@REM
@REM     REM Start the frontend application
@REM     npm start
@REM
@REM     REM Return to the main directory
@REM     cd ..
@REM ) ELSE (
@REM     echo Frontend directory not found.
@REM )

