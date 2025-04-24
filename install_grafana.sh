#!/bin/bash

# Script to automate Grafana installation and service setup

# Step 1: Install dependencies
echo "Installing dependencies..."
apt-get install -y apt-transport-https software-properties-common

# Step 2: Add Grafana GPG key
echo "Adding Grafana GPG key..."
wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key

# Step 3: Add Grafana repository
echo "Adding Grafana repository..."
echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | tee -a /etc/apt/sources.list.d/grafana.list

# Step 4: Update apt cache
echo "Updating package list..."
apt-get update

# Step 5: Install Grafana
echo "Installing Grafana..."
apt-get install -y grafana

# Step 6: Reload systemd
echo "Reloading systemd daemon..."
systemctl daemon-reload

# Step 7: Enable Grafana service
echo "Enabling grafana-server..."
systemctl enable grafana-server.service

# Step 8: Start Grafana service
echo "Starting grafana-server..."
systemctl start grafana-server

# Optionally, check status
echo "Grafana server status:"
systemctl status grafana-server
