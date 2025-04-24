#!/bin/bash

# Script to automate Node Exporter installation and setup

# Step 1: Download Node Exporter
echo "Downloading Node Exporter..."
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz

# Step 2: Extract the archive
echo "Extracting Node Exporter..."
tar xvfz node_exporter-*.tar.gz

# Step 3: Move the binary to /usr/local/bin
echo "Moving node_exporter to /usr/local/bin..."
mv node_exporter-1.5.0.linux-amd64/node_exporter /usr/local/bin

# Step 4: Clean up extracted files
echo "Cleaning up..."
rm -r node_exporter-1.5.0.linux-amd64*

# Step 5: Create a system user for Node Exporter
echo "Creating node_exporter user..."
useradd -rs /bin/false node_exporter

# Step 6: Move systemd service file
echo "Moving node_exporter.service to /etc/systemd/system/..."
mv node_exporter.service /etc/systemd/system/

# Step 7: Enable Node Exporter to start on boot
echo "Enabling node_exporter service..."
systemctl enable node_exporter

# Step 8: Reload systemd to pick up new service
echo "Reloading systemd daemon..."
systemctl daemon-reload

# Step 9: Start Node Exporter
echo "Starting node_exporter..."
systemctl start node_exporter

# Step 10: Check status
echo "Checking node_exporter service status..."
systemctl status node_exporter
