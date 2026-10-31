# Take Stock — Pi version (shared data)

This branch (`pi`) is the Pi-hosted, shared version of Take Stock.
`main` stays the browser-only version served by GitHub Pages — nothing
here changes Pages.

## How it works

- `index.html` is the same app as on `main`, plus a Pi check: on load it
  tries `GET /api/data`. If a Pi server answers, it uses that shared list
  and saves every change back to the Pi. If no server answers (for
  example on GitHub Pages), it falls back to this browser only.
- `server.py` is a stdlib-only Python server (no dependencies). It serves
  the static files and:
  - `GET /api/data` — the shared list
  - `POST /api/data` — replace the shared list
  - `GET /api/health` — `{"ok": true}`
- Shared data lives in `/data/data.json` inside the container. Mount a
  Docker volume at `/data` so it survives restarts and rebuilds.

## Run it in Portainer

1. Build an image from this branch: build URL
   `https://github.com/bobuildington/take-stock.git#pi`, Dockerfile
   field `Dockerfile`, image name e.g. `take-stock-pi:latest`.
2. Add a container from that image, host port `8082` (or any free port)
   to container port `80`, TCP.
3. In Volumes, map a volume (e.g. `take-stock-data`) to container path
   `/data`.
4. Restart policy: Unless stopped. Deploy.
5. Open `http://<Pi IP>:8082` — everyone opening that address shares
   the same stock list.

## Notes

- Last write wins: if two people edit at the same time, the later save
  replaces the earlier one. There is a "Reload shared data from Pi"
  button in Settings to pull the latest shared copy.
- No login in v1. Anyone on your home network who opens the app can
  see and change the shared list. Do not expose this port to the
  internet.
- Back up the volume's `data.json` if the shared list matters to you.
  Exporting from the app also works as a backup.
