#!/bin/sh

# Define directories
BUILD_DIR="./build"
DEPLOY_DIR="/srv/http"
BACKUP_DIR="/srv/http_backup"

# Check if backup directory exists, create it if it doesn't
if [ ! -d "$BACKUP_DIR" ]; then
    echo "Backup directory $BACKUP_DIR not found. Creating it..."
    sudo mkdir -p $BACKUP_DIR
    if [ $? -ne 0 ]; then
        echo "Failed to create backup directory. Deployment aborted."
        exit 1
    fi
fi

# Clear existing backup
echo "Clearing existing backup in $BACKUP_DIR..."
sudo rm -rf $BACKUP_DIR/*

# Create a backup of the current deployment
echo "Creating backup of the current contents in $DEPLOY_DIR..."
sudo cp -r $DEPLOY_DIR/* $BACKUP_DIR

# Verify successful backup
if [ $? -ne 0 ]; then
    echo "Backup failed. Deployment aborted."
    exit 1
fi

# Remove current contents in the deployment directory
echo "Removing current contents in $DEPLOY_DIR..."
sudo rm -rf $DEPLOY_DIR/*

# Copy new build to the deployment directory
echo "Copying new build to $DEPLOY_DIR..."
sudo cp -r $BUILD_DIR/* $DEPLOY_DIR

# Verify successful copy
if [ $? -eq 0 ]; then
    echo "Deployment successful."
else
    echo "Deployment failed. Check for errors."
fi
