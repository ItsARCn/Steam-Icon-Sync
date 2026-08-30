# Steam KDE Icon Sync

Fix missing Steam game icons in KDE Plasma.

Some Steam games create `.desktop` launchers that use the generic Steam icon instead of the game's actual artwork. `steam-kde-icon-sync` finds the game's cached Steam artwork and gives the launcher its proper icon.

Works with KDE application menus, KRunner, and other applications that use `.desktop` files.

## Features

- 🎮 Fix missing Steam game icons
- 🖼️ Uses artwork already cached by Steam
- 🖥️ Works with KDE Plasma and KRunner
- ⚡ Lightweight and runs only when you use it
- 🚫 No background service
- 🚫 No timer
- 🚫 No daemon
- 🔒 Does not modify Steam's own files
- ↩️ Can safely undo changes made by `si`

## Commands

### `si`

Finds Steam games using the generic Steam icon and replaces it with the game's cached artwork.

```bash
si
