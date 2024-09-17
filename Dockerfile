# Dockerfile
FROM alpine:latest

# Install nmap, python3, and any additional packages
RUN apk add --no-cache nmap python3

# Set default command
CMD ["/bin/sh"]
