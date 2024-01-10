#!/bin/sh

# Run build.sh
echo "Starting the build process..."
./build.sh

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "Build successful. Starting the publishing process..."
    ./publish.sh

    # Check if publish was successful
    if [ $? -eq 0 ]; then
        echo "Publishing successful."
    else
        echo "Publishing failed."
    fi
else
    echo "Build failed. Publishing process not started."
fi
