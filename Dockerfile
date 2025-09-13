FROM ubuntu:22.04

# Always run as root (default in base image)
USER root

# Set noninteractive frontend to avoid prompts during install
ENV DEBIAN_FRONTEND=noninteractive

# Install development tools and dependencies
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    bison \
    cmake \
    curl \
    wget \
    python3 \
    python3-pip \
    ninja-build \
    clang \
    lld \
    openjdk-11-jdk \
    graphviz \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set default shell
CMD ["/bin/bash"]
