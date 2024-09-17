# Use the latest version of Alpine Linux
FROM alpine:latest

# Set environment variables for Python
ENV PYTHONUNBUFFERED=1

# Update package manager, install required system packages and build dependencie1
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
    libc-dev \
    py3-virtualenv

# Create a virtual environment for Python packages
RUN python3 -m venv /opt/venv

# Activate the virtual environment and install required Python packages
RUN /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install \
    blinker==1.8.2 \
    click==8.1.7 \
    Flask==3.0.3 \
    itsdangerous==2.2.0 \
    Jinja2==3.1.4 \
    MarkupSafe==2.1.5 \
    Werkzeug==3.0.4

# Add the virtual environment's bin directory to PATH
ENV PATH="/opt/venv/bin:$PATH"

# Clean up build dependencies to reduce image size
RUN apk del build-base gcc musl-dev libc-dev

# Set the default command to run an interactive shell when the container starts
CMD ["/bin/sh"]
