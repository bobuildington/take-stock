# Take Stock — static app served with nginx.
# Build from the repo root (e.g. from its Git URL in a Docker build UI).
# The app itself stores everything in the browser (localStorage);
# this image only serves the static files, it does not store your data.
FROM nginx:alpine
COPY index.html manifest.webmanifest sw.js icon.svg /usr/share/nginx/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
