FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl gnupg software-properties-common

# Install Visual Studio Code (code-server)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Expose code-server port
EXPOSE 8080

# Start code-server
ENTRYPOINT ["code-server", "--bind-addr", "0.0.0.0:8080", "--auth", "none"]
