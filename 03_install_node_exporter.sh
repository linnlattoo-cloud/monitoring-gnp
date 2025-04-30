#!/bin/bash

# Script to automate Node Exporter installation and setup

# Define version variable
VERSION="1.9.1"

# Step 1: Download Node Exporter
echo "Downloading Node Exporter version ${VERSION}..."
wget https://github.com/prometheus/node_exporter/releases/download/v${VERSION}/node_exporter-${VERSION}.linux-amd64.tar.gz

# Step 2: Extract the archive
echo "Extracting Node Exporter..."
tar xvfz node_exporter-${VERSION}.linux-amd64.tar.gz

# Step 3: Move the binary to /usr/local/bin
echo "Installing node_exporter binary..."
mv node_exporter-${VERSION}.linux-amd64/node_exporter /usr/local/bin/

# Step 4: Clean up extracted files
echo "Cleaning up..."
rm -r node_exporter-${VERSION}.linux-amd64*
rm node_exporter-${VERSION}.linux-amd64.tar.gz

# Step 5: Create a system user for Node Exporter
echo "Creating node_exporter user..."
useradd -rs /bin/false node_exporter

# Step 6: Move systemd service file
echo "Setting up systemd service..."
mv node_exporter.service /etc/systemd/system/

# Step 7: Reload systemd to pick up new service
echo "Reloading systemd daemon..."
systemctl daemon-reload

# Step 8: Enable Node Exporter to start on boot
echo "Enabling node_exporter service..."
systemctl enable node_exporter

# Step 9: Start Node Exporter
echo "Starting node_exporter..."
systemctl start node_exporter

# Step 10: Check status
echo "Checking node_exporter service status..."
systemctl status node_exporter

