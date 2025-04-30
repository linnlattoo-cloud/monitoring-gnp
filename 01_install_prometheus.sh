#!/bin/bash

set -e

# Set version
VERSION="3.3.0"

# Download Prometheus tarball
echo "Downloading Prometheus v${VERSION}..."
wget -q --show-progress "https://github.com/prometheus/prometheus/releases/download/v${VERSION}/prometheus-${VERSION}.linux-amd64.tar.gz"

# Extract
echo "Extracting files..."
tar -xzf "prometheus-${VERSION}.linux-amd64.tar.gz"

# Clean up the tarball
echo "Cleaning up downloaded archive..."
rm -f "prometheus-${VERSION}.linux-amd64.tar.gz"

# Create necessary directories
echo "Creating configuration and data directories..."
sudo mkdir -p /etc/prometheus /var/lib/prometheus

# Move into the extracted folder
cd "prometheus-${VERSION}.linux-amd64"

# Move binaries to /usr/local/bin
echo "Installing binaries..."
sudo mv prometheus promtool /usr/local/bin/

# Move configuration files
echo "Setting up configuration..."
sudo mv prometheus.yml /etc/prometheus/

# Final message
echo "Prometheus v${VERSION} installation completed successfully!"

