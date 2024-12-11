#!/bin/bash

# Detect Operating System
OS=$(uname)

# Set path for driver
DRIVER_PATH="./src/main/java/driver.jar"

# Set classpath based on OS
if [[ "$OS" == "Darwin" ]] || [[ "$OS" == "Linux" ]]; then
  # Unix-based (macOS, Linux)
  CLASSPATH="./bin:$DRIVER_PATH"
elif [[ "$OS" == "MINGW"* ]] || [[ "$OS" == "MSYS"* ]]; then
  # Windows (Git Bash or WSL)
  CLASSPATH="./bin;$DRIVER_PATH"
else
  echo "Unsupported OS."
  exit 1
fi

# Create a bin directory if it doesn't exist
mkdir -p bin

## Clean out the directory if it already does
#rm -rf bin/*

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

## If the frontend JavaScript exists, start it
#if [ -d "./frontend" ]; then
#  echo "Running frontend..."
#  cd frontend
#
#  # Install dependencies (if Node.js is used)
#  npm install
#
#  # Run the JavaScript application
#  npm start
#
#  cd ..
#else
#  echo "Frontend directory not found."
#fi



##!/bin/bash
#
## Create a bin directory if it doesn't exist
#mkdir -p bin
#
## Clean out the directory if it already does
#rm -rf bin/*
#
## Find all .java files
#find ./src -name "*.java" > sources.txt
#
## Locate all files in src folder
#echo
#ls -R src/main/java
#
## Compile java files
#javac -cp "./bin;./src/main/java/driver.jar" -d ./bin @sources.txt
#echo
## Check if the compilation was successful
#if [ $? -eq 0 ]; then
#  echo "Compilation was successful."
#else
#  echo "Compilation failed."
#  exit 1
#fi
#
## Verify the compiled classes are int eh bin directory
#echo
#ls -R bin
#echo
#
## Run the program
#java -Xdiag -cp "./bin;./src/main/java/driver.jar" MovieDatabase
