@echo off

:: Get current JDK version
::for /f "tokens=2 delims= " %%a in ('java -version 2^>^&1 ^| findstr /i "version"') do set version=%%a

:: Remove quotes from version string
::set version=%version:"=%

:: Extract major version number
::for /f "tokens=1 delims=." %%b in ("%version%") do set major_version=%%b

:: Check if the version is less than 20
::if %major_version% lss 20 (
    ::echo Current JDK version is not compatible. Installing new version...

    :: Run OpenJDK installer
    ::powerShell -Command "Expand-Archive -Path jdk-23_windows-x64_bin.zip"
    ::start /wait jdk-23_windows-x64_bin\jdk-23_windows-x64_bin.exe

    :: Delete decompressed install folder after install
    ::rmdir /s /q jdk-23_windows-x64_bin
::) else (
    ::echo Current JDK version is compatible. Skipping installation.
::)
powerShell -Command "Expand-Archive -Path jdk-23_windows-x64_bin.zip"
start /wait jdk-23_windows-x64_bin\jdk-23_windows-x64_bin.exe
rmdir /s /q jdk-23_windows-x64_bin

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











