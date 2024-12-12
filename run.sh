#!/bin/bash

# Detect Operating System
OS=$(uname)

# Set path for driver
DRIVER_PATH="./src/main/java/driver.jar"

# Desired JDK version
DESIRED_VERSION="20"

# Function to get the current Java version
get_current_version() {
  java -version 2>&1 | head -n 1 | awk -F '"' '{print $2}' | awk -F. '{print $1}'
}

# Current JDK version
CURRENT_VERSION=$(get_current_version)

MAC_ZIP_FILE="jdk-23_macos-x64_bin.zip"
WINDOWS_ZIP_FILE="jdk-23_windows-x64_bin.zip"

# Set classpath based on OS
if [[ "$OS" == "Darwin" ]] || [[ "$OS" == "Linux" ]]; then
  # Unix-based (macOS)
  CLASSPATH="./bin:$DRIVER_PATH"
  XAMPP_PATH="/opt/lampp/bin/mysqldump"

  if ["$CURRENT_VERSION" -lt "$DESIRED_VERSION"]; then
    UNZIP_DIRECTORY="jdk-23_macos-x64_bin"
    mkdir -p "$UNZIP_DIRECTORY"
    unzip -q "$MAC_ZIP_FILE" -d UNZIP_DIRECTORY

    # Find the DMG file inside the extracted folder
    DMG_FILE=$(find "$UNZIP_DIR" -name "*.dmg" | head -n 1)

    # Mount the DMG file
    MOUNT_DIR=$(hdiutil attach "$DMG_FILE" | grep Volumes | awk '{print $3}')

    # Run the installer
    sudo installer -pkg "$MOUNT_DIR"/<installer-name>.pkg -target /

    # Unmount the DMG
    hdiutil detach "$MOUNT_DIR"

    # Clean up temporary files
    echo "Cleaning up temporary files..."
    rm -rf "$UNZIP_DIR"
fi

elif [[ "$OS" == "MINGW"* ]] || [[ "$OS" == "MSYS"* ]]; then
  # Windows
  CLASSPATH="./bin;$DRIVER_PATH"
  XAMPP_PATH="C:/xampp/mysql/bin/mysqldump"

  if [ -z "$CURRENT_VERSION" ] || [ "$CURRENT_VERSION" -lt "$DESIRED_VERSION" ]; then
    echo "Current JDK version is not compatible. Installing new version..."

    # Path to the JDK installer zip file
    ZIP_FILE="jdk-23_windows-x64_bin.zip"
    UNZIP_DIRECTORY="jdk-23_windows-x64_bin"

    # Unzip the file
    mkdir -p "$UNZIP_DIRECTORY"
    unzip -q "$ZIP_FILE" -d "$UNZIP_DIRECTORY"

    # Use cmd.exe to run the installer with the correct Windows path
    INSTALLER_PATH=$(cygpath -w "$UNZIP_DIRECTORY/jdk-23_windows-x64_bin.exe")
    start /wait "$INSTALLER_PATH" &
    read -p "Press enter after Java is installed..."
    rm -rf "$UNZIP_DIRECTORY"
  else
    echo "Current JDK version is compatible. Skipping OpenJDK install..."
  fi
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