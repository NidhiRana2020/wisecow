# Dockerfile - simple image to run wisecow.sh
FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    netcat-openbsd \
    fortune-mod \
    cowsay \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the script from repo
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

EXPOSE 4499

# Run the script (it starts its HTTP server)
CMD ["./wisecow.sh"]
