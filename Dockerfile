# Take Stock — Pi version (shared data).
# This Dockerfile is for the `pi` branch only. `main` keeps the nginx-only
# Dockerfile for the GitHub Pages / browser-only version.
# The Pi image serves the app AND a tiny Python backend (server.py) that
# stores the shared stock list in /data/data.json. Mount a Docker volume
# at /data so the shared list survives container restarts and rebuilds.
FROM python:3-alpine
WORKDIR /app
COPY index.html manifest.webmanifest sw.js icon.svg server.py ./
RUN mkdir -p /data
VOLUME ["/data"]
ENV DATA_FILE=/data/data.json PORT=80
EXPOSE 80
CMD ["python", "server.py"]
