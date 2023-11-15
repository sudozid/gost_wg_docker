# Use a lightweight base image
FROM alpine:latest

# Install dependencies including WireGuard
RUN apk add --no-cache curl wireguard-tools

# Set environment variables with default values for gost
ENV GOST_USER=admin \
    GOST_PASS=123456 \
    GOST_HOST=localhost \
    GOST_PORT=8080

# Set the working directory
WORKDIR /gost

# Download the latest release of gost for Linux AMD64 and rename it
RUN wget $(curl -s https://api.github.com/repos/ginuerzh/gost/releases/latest \
    | grep "browser_download_url.*linux-amd64" \
    | cut -d '"' -f 4) \
    && gunzip *.gz \
    && mv gost-linux-amd64-* gost \
    && chmod +x gost

# Copy the entry point script to the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entry point script as the entry point
ENTRYPOINT ["/entrypoint.sh"]
