#!/bin/bash

# Exit on error
set -e

# Download Prometheus tarball
echo "Downloading Prometheus..."
wget https://github.com/prometheus/prometheus/releases/download/v2.37.6/prometheus-2.37.6.linux-amd64.tar.gz

# Extract the tarball
echo "Extracting Prometheus..."
tar xvfz prometheus-2.37.6.linux-amd64.tar.gz

# Remove the tarball
echo "Cleaning up..."
rm prometheus-2.37.6.linux-amd64.tar.gz

# Create required directories
echo "Creating Prometheus directories..."
sudo mkdir -p /etc/prometheus /var/lib/prometheus

# Change into the extracted directory
cd prometheus-2.37.6.linux-amd64

# Move binaries to /usr/local/bin
echo "Installing Prometheus binaries..."
sudo mv prometheus promtool /usr/local/bin/

# Move configuration files
echo "Setting up Prometheus configuration..."
sudo mv prometheus.yml /etc/prometheus/prometheus.yml
sudo mv consoles/ console_libraries/ /etc/prometheus/

echo "Prometheus installation complete."
