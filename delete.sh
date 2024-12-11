#!/bin/bash

DRIVER_PATH="./src/main/java/driver.jar"

# Detect Operating System
OS=$(uname)

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

java -cp "$CLASSPATH" DeleteDatabase
