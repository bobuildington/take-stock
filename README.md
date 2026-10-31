# Take Stock

A private pantry / stock tracker as a GitHub Pages app. No account, no server, no sync.

## What it does

- Track pantry, freezer, fridge, cupboard, and garage stock
- Quantity, unit, category, location, expiry date, and low-stock level per item
- Quick +1 / −1 buttons, edit, and delete
- "Use first" sorting: expired first, then expiring soon, then the rest
- Low-stock, expiring-soon, and expired filters, plus search
- A shopping list, with one tap to add all low-stock items
- Light / dark theme
- Export / import JSON backup, and erase everything
- Installable as an app (PWA) with an offline copy

## How your data is stored

Everything is saved in your browser's localStorage on your own device, under the key `take-stock-v1`. Nothing is sent anywhere. Export a backup before clearing browser data.

## Run it on GitHub Pages

Deploy from the `main` branch, root folder. Then open the Pages URL, or install it from Settings → Install & offline when your browser offers it.
