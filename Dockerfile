FROM alpine

# Install dependencies
RUN apk add --no-cache bash curl

RUN curl -L -o /usr/local/bin/qbittorrent-nox https://github.com/userdocs/qbittorrent-nox-static/releases/latest/download/x86_64-qbittorrent-nox \
    && chmod 700 /usr/local/bin/qbittorrent-nox

# Set environment variables for configuration and default download path
ENV QBT_CONFIG_PATH="/config"
ENV QBT_DOWNLOAD_PATH="/downloads"

# Expose qBittorrent's Web UI port
EXPOSE 8080

# Create necessary directories and set permissions
RUN mkdir $QBT_CONFIG_PATH $QBT_DOWNLOAD_PATH

CMD ["/usr/local/bin/qbittorrent-nox", "--profile=/config"]