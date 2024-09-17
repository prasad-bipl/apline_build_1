# Use the latest version of Alpine Linux
FROM alpine:latest

# Set environment variables for Python
ENV PYTHONUNBUFFERED=1

# Update the package manager and install required system packages
RUN apk update && \
    apk add --no-cache \
    python3 \
    py3-pip \
    nmap

# Upgrade pip to the latest version
RUN pip3 install --upgrade pip

# Install the required Python packages via pip
RUN pip3 install \
    blinker==1.8.2 \
    click==8.1.7 \
    Flask==3.0.3 \
    itsdangerous==2.2.0 \
    Jinja2==3.1.4 \
    MarkupSafe==2.1.5 \
    Werkzeug==3.0.4

# Set the default command to run an interactive shell when the container starts
CMD ["/bin/sh"]
