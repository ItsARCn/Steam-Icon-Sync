# Steam KDE Icon Sync

Fix missing Steam game icons in KDE Plasma.

Some Steam games have `.desktop` launchers that use the generic Steam icon instead of the game's actual artwork. `steam-kde-icon-sync` finds the game's cached Steam artwork and automatically gives the launcher its proper icon.

## Features

- 🎮 Fixes missing Steam game icons in KDE Plasma
- 🔎 Uses artwork already cached by Steam
- 🖥️ Works with KRunner and KDE application menus
- ⚡ Lightweight and runs only when you execute `si`
- 🚫 No background service
- 🚫 No timer
- 🚫 No daemon
- 🧹 Doesn't modify Steam's own files

## How it works

Steam stores game artwork in its local library cache.

`si`:

1. Scans Steam's library artwork cache.
2. Finds `logo.png` for each game.
3. Copies the artwork to your local KDE icon directory.
4. Finds the corresponding Steam `.desktop` launcher.
5. Replaces `Icon=steam` with a game-specific icon.
6. Refreshes KDE's application cache.

## Requirements

- Linux
- KDE Plasma
- Steam for Linux
- Bash
- `kbuildsycoca6`

The default Steam installation location is:

```text
~/.local/share/Steam
