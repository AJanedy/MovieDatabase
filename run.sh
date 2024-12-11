#!/bin/bash

# Detect Operating System
OS=$(uname)

# Set path for driver
DRIVER_PATH="./src/main/java/driver.jar"

# Set classpath based on OS
if [[ "$OS" == "Darwin" ]] || [[ "$OS" == "Linux" ]]; then
  # Unix-based (macOS, Linux)
  CLASSPATH="./bin:$DRIVER_PATH"
  XAMPP_PATH="/opt/lampp/bin/mysqldump"
elif [[ "$OS" == "MINGW"* ]] || [[ "$OS" == "MSYS"* ]]; then
  # Windows
  CLASSPATH="./bin;$DRIVER_PATH"
  XAMPP_PATH="C:/xampp/mysql/bin/mysqldump"
else
  echo "Unsupported OS."
  exit 1
fi

# Create a bin directory if it doesn't exist
mkdir -p bin

# Find all .java files
find ./src -name "*.java" > sources.txt

# Compile Java files
echo
echo "Compiling Java files..."
javac -cp "$CLASSPATH" -d ./bin @sources.txt

# Check if the compilation was successful
if [ $? -eq 0 ]; then
  echo "Compilation was successful."
  echo
else
  echo "Compilation failed."
  echo
  exit 1
fi

# Run the Java program
echo "Running backend Java program..."
java -cp "$CLASSPATH" MovieDatabase

# Ensure mysqldump exists
if [[ ! -f "$XAMPP_PATH" ]]; then
    echo "mysqldump not found at $XAMPP_PATH"
    exit 1
fi

# Determine the folder the script is running from
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Run mysqldump command to dump the movie_ratings database into an SQL file in the same directory as the script
"$XAMPP_PATH" -u root movie_ratings > "$SCRIPT_DIR/movie_ratings.sql"

# Check if mysqldump was successful
if [ $? -eq 0 ]; then
    echo "Sql file saved to root folder."
else
    echo "mysqldump failed."
    exit 1
fi



