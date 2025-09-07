    # Use a base image (e.g., Ubuntu, Alpine, Debian)
    FROM python:3.11-slim-bookworm

    # Set environment variables (optional)
    ENV DEBIAN_FRONTEND=noninteractive

    # Install Git and other software
    RUN apt-get update && \
        apt-get install -y git zip && \
        apt-get install -y build-essential && \
        apt-get install -y gfortran libgfortran-12-dev && \
        rm -rf /var/lib/apt/lists/* && \
        pip3 install meson ninja

    # Define the default command to run when a container starts (optional)
    CMD ["bash"]