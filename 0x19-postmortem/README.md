# Postmortem: Outage of E-Commerce Website Due to Load Balancer Misconfiguration

## Issue Summary
- **Duration**: Feb 25, 2025, 2:00 PM UTC to Feb 25, 2025, 3:00 PM UTC (1 hour)
- **Impact**: The e-commerce website became completely inaccessible, affecting 100% of users. Customers were unable to browse products, add items to their cart, or complete purchases.
- **Root Cause**: A misconfigured load balancer routed all traffic to a single server, causing it to crash under high load.

## Timeline
- **2:00 PM**: Issue detected via monitoring alerts indicating a spike in server CPU usage and a sudden drop in traffic to the website.
- **2:05 PM**: Engineers noticed the website was returning 503 errors (Service Unavailable).
- **2:10 PM**: Initial assumption was a server hardware failure. Investigation focused on the primary server’s health metrics.
- **2:20 PM**: Misleading path: Engineers suspected a database issue, but the database was functioning normally.
- **2:30 PM**: Incident escalated to the Infrastructure and DevOps teams.
- **2:40 PM**: Root cause identified as a misconfigured load balancer. The load balancer was routing all traffic to a single server instead of distributing it across multiple servers.
- **2:50 PM**: Temporary fix implemented by reconfiguring the load balancer to distribute traffic evenly across all available servers.
- **3:00 PM**: Full service restored after confirming the fix and monitoring system stability.

## Root Cause and Resolution
- **Root Cause**: The load balancer was misconfigured during a recent deployment. Instead of distributing traffic across all servers in the pool, it was routing all traffic to a single server. This caused the server to crash under high load.
- **Resolution**: The load balancer configuration was corrected to distribute traffic evenly across all servers. The crashed server was restarted, and traffic was successfully routed to all available servers.

## Corrective and Preventative Measures
- **Improvements**:
  - Review and test load balancer configurations after every deployment.
  - Implement automated checks to ensure traffic is distributed evenly across servers.
  - Enhance monitoring to detect uneven traffic distribution and server overloads.
- **Tasks**:
  - Patch the load balancer configuration to prevent similar misconfigurations in the future.
  - Add monitoring for server load and traffic distribution.
  - Conduct a post-deployment checklist to verify load balancer settings.
  - Document the incident and share learnings with the team to prevent recurrence.
