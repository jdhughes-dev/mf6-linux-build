    # Use a base image (e.g., Ubuntu, Alpine, Debian)
    FROM ubuntu:latest

    # Set environment variables (optional)
    ENV DEBIAN_FRONTEND=noninteractive

    # Install Git and other software
    RUN sudo add-apt-repository ppa:ubuntu-toolchain-r/test && \
        apt-get update && \
        apt-get install -y git curl nano && \
        apt-get install -y meson ninja-build && \
        apt-get install -y build-essential && \
        apt-get install -y gfortran && \
        apt-get install -y libgfortran-13-dev && \
        rm -rf /var/lib/apt/lists/*

    # Define the default command to run when a container starts (optional)
    CMD ["bash"]