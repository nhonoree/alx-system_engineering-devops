# Web Stack Debugging #4

This project focuses on debugging and optimizing an Nginx web server to handle high traffic loads. The Puppet manifest provided adjusts the Nginx configuration to increase the number of worker connections and the maximum number of open files, ensuring the server can handle 1000 requests with 100 at a time.

## Files
- `0-the_sky_is_the_limit_not.pp`: Puppet manifest to adjust Nginx configuration.
