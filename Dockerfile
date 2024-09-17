# Use the latest version of Alpine Linux
FROM alpine:latest

# Set environment variables for Python
ENV PYTHONUNBUFFERED=1

# Update package manager, install required system packages and build dependencies
RUN apk update && \
    apk add --no-cache \
    python3 \
    py3-pip \
    nmap \
    build-base \
    libffi-dev \
    openssl-dev \
    musl-dev \
    gcc \
    libc-dev

# Upgrade pip to the latest version
RUN python3 -m pip install --upgrade pip

# Install the required Python packages via pip
RUN pip3 install \
    blinker==1.8.2 \
    click==8.1.7 \
    Flask==3.0.3 \
    itsdangerous==2.2.0 \
    Jinja2==3.1.4 \
    MarkupSafe==2.1.5 \
    Werkzeug==3.0.4

# Clean up build dependencies to reduce the image size
RUN apk del build-base gcc musl-dev libc-dev

# Set the default command to run an interactive shell when the container starts
CMD ["/bin/sh"]
