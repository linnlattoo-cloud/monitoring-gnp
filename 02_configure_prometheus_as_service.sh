#!/bin/bash

# Script to automate Prometheus service setup

# Step 1: Create a system user for Prometheus
echo "Creating prometheus user..."
useradd -rs /bin/false prometheus

# Step 2: Change ownership of Prometheus directories
echo "Changing ownership of /etc/prometheus and /var/lib/prometheus..."
chown -R prometheus: /etc/prometheus /var/lib/prometheus

# Step 3: Copy systemd service file
echo "Copying prometheus.service to /etc/systemd/system/..."
cp prometheus.service /etc/systemd/system/

# Step 4: Reload systemd manager configuration
echo "Reloading systemd daemon..."
systemctl daemon-reload

# Step 5: Enable Prometheus to start on boot
echo "Enabling prometheus service..."
systemctl enable prometheus

# Step 6: Start Prometheus service
echo "Starting prometheus service..."
systemctl start prometheus

# Step 7: Check Prometheus service status
echo "Checking prometheus service status..."
systemctl status prometheus
