#!/bin/bash

# Download Node Exporter
curl -LO https://github.com/prometheus/node_exporter/releases/latest/download/node_exporter-linux-amd64.tar.gz

# Extract and install
tar -xvzf node_exporter-linux-amd64.tar.gz
sudo mv node_exporter*/node_exporter /usr/local/bin/

# Create a service file
cat <<EOF | sudo tee /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=default.target
EOF

# Start and enable Node Exporter
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter
