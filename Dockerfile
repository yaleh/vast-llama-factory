# Use the specified Vast.ai base image
FROM vastai/base-image:cuda-12.6.3-cudnn-devel-ubuntu24.04-py313

# Set the working directory (already default in base image, but good practice)
WORKDIR /workspace

# Clone the LLaMA-Factory repository
RUN git clone https://github.com/hiyouga/LLaMA-Factory.git

# Change working directory to the cloned repository
WORKDIR /workspace/LLaMA-Factory

# Install LLaMA-Factory dependencies using the pip from the pre-configured venv
# The base image creates a venv at /venv/main with the specified Python version (3.13)
RUN /venv/main/bin/pip install -e ".[torch,metrics,bitsandbytes]"

# Optional: Set the default working directory back to /workspace if desired
# WORKDIR /workspace 