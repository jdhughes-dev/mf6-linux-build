    # Use a base image (e.g., Ubuntu, Alpine, Debian)
    FROM ubuntu:latest

    # Set environment variables (optional)
    ENV DEBIAN_FRONTEND=noninteractive

    # Install Git and other software
    RUN add-apt-repository ppa:deadsnakes/ppa && \
        apt-get update && \
        apt-get install -y git && \
        apt-get install -y build-essential && \
        apt-get install -y gfortran libgfortran-13-dev && \
        apt-get install -y libgfortran-13-dev && \
        apt-get install -y python3.11 && \
        rm -rf /var/lib/apt/lists/* && \
        pip install meson ninja

    # Define the default command to run when a container starts (optional)
    CMD ["bash"]