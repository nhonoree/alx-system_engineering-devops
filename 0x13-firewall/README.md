# 0x13-firewall

This project focuses on configuring and managing a firewall using `ufw` and `iptables` on a Linux server.

## Tasks

### 0. Block all incoming traffic but
Configure `ufw` to block all incoming traffic except for ports 22 (SSH), 80 (HTTP), and 443 (HTTPS).

### 1. Port Forwarding
Set up port forwarding to redirect traffic from port 8080 to port 80.

### 2. Firewall Configuration
Configure advanced firewall rules, such as allowing specific IP ranges and blocking certain IPs.

### 3. Firewall Debugging
Debug firewall rules and check open ports using tools like `netstat`, `ss`, and `telnet`.

## Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/alx-system_engineering-devops.git
   cd alx-system_engineering-devops/0x13-firewall
