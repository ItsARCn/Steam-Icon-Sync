# Steam KDE Icon Sync

Fix missing Steam game icons in KDE Plasma.

Steam sometimes creates game launchers that use the generic Steam icon instead of the game's actual artwork. Steam KDE Icon Sync finds the artwork already cached by Steam and uses it for the game's KDE launcher.

Designed for KDE Plasma, KRunner, and other applications that use `.desktop` launchers.

## Features

* 🎮 Fix missing Steam game icons
* 🖼️ Uses artwork already downloaded by Steam
* 🖥️ Works with KDE Plasma and KRunner
* ⚡ Lightweight
* 🚫 No background service
* 🚫 No timer
* 🚫 No daemon
* 🔒 Does not modify Steam's game files
* ↩️ Safely undo changes made by `si`
* 🧠 Tracks exactly which launchers were changed

## Installation

You do not need to clone the repository.

### Using curl

```
curl -fsSL https://raw.githubusercontent.com/ItsARCn/steam-kde-icon-sync/main/install.sh | bash
```

### Using wget

```
wget -qO- https://raw.githubusercontent.com/ItsARCn/steam-kde-icon-sync/main/install.sh | bash
```

The installer supports both `curl` and `wget`.

It installs:

```
~/.local/bin/si
~/.local/bin/si-clean
```

After installation, you can use the commands from anywhere in the terminal.

### Manual installation

If you prefer to clone the repository:

```
git clone https://github.com/ItsARCn/steam-kde-icon-sync.git
cd steam-kde-icon-sync
./install.sh
```

## Usage

### Fix Steam game icons

Run:

```
si
```

`si` scans Steam's cached game artwork and finds Steam game launchers that are still using the generic Steam icon.

For example:

```
✓ Changed icon: Banana
✓ Changed icon: Allumeria

✓ Done. Updated 2 icon(s).
```

If everything is already fixed:

```
No icons needed updating.
```

Run `si` whenever you install a new Steam game or notice a game using the generic Steam icon.

### Undo changes made by si

Run:

```
si-clean
```

This restores the original icon setting and removes the icon files created by `si`.

Example:

```
✓ Restored icon: Banana
✓ Restored icon: Allumeria

✓ Done. Restored 2 icon(s).
```

`si-clean` only cleans up changes that were recorded by `si`.

## Uninstallation

To remove Steam KDE Icon Sync:

```
./uninstall.sh
```

If you cloned the repository, run it from the project directory.

For a remote uninstall, you can use curl:

```
curl -fsSL https://raw.githubusercontent.com/ItsARCn/steam-kde-icon-sync/main/uninstall.sh | bash
```

Or wget:

```
wget -qO- https://raw.githubusercontent.com/ItsARCn/steam-kde-icon-sync/main/uninstall.sh | bash
```

The uninstaller removes:

```
~/.local/bin/si
~/.local/bin/si-clean
```

It does NOT remove:

* Steam game icons
* `.desktop` files
* Steam files
* Your Steam games
* Changes made to your system outside the utility

If you ran `si-clean` before uninstalling, the icons created by `si` have already been removed and the original icons have been restored.

If you uninstall without running `si-clean`, the icons and `.desktop` changes made by `si` are intentionally left untouched.

## How It Works

Steam stores game artwork in its local library cache.

When you run `si`, it:

1. Scans Steam's library artwork cache.
2. Finds the game's `logo.png`.
3. Finds the matching Steam `.desktop` launcher.
4. Checks whether the launcher currently uses `Icon=steam`.
5. Copies the artwork into KDE's local icon directory.
6. Changes the launcher to use a game-specific icon.
7. Records the original icon setting.
8. Refreshes KDE's application cache.

The game-specific icons are stored in:

```
~/.local/share/icons/hicolor/256x256/apps/
```

Tracking information is stored in:

```
~/.local/share/steam-kde-icon-sync/managed
```

## Safe Cleanup

`si-clean` does not simply delete every Steam-looking icon.

When `si` changes a launcher, it records:

* The Steam App ID
* The `.desktop` file that was changed
* The original icon setting

This allows `si-clean` to restore only the changes made by `si`.

For example:

```
Before:
Icon=steam

After running si:
Icon=steam_2923300

After running si-clean:
Icon=steam
```

This prevents `si-clean` from accidentally removing unrelated icons or overwriting changes made by the user.

## No Background Processes

Steam KDE Icon Sync does not run continuously.

There is:

* No systemd service
* No systemd timer
* No daemon
* No periodic scanning
* No background resource usage

The program only runs when you execute `si` or `si-clean`.

This keeps it lightweight and avoids unnecessary CPU or RAM usage.

## Requirements

* Linux
* KDE Plasma
* Steam for Linux
* Bash
* `kbuildsycoca6`
* `curl` or `wget` for the quick installer

The default Steam library location is:

```
~/.local/share/Steam
```

## Limitations

The current version expects Steam's artwork cache at:

```
~/.local/share/Steam/appcache/librarycache
```

It also expects Steam game launchers to be located in:

```
~/.local/share/applications
```

Steam's cache structure and artwork availability can vary between installations and Steam versions.

## Troubleshooting

### A game still has the Steam icon

Run:

```
si
```

If it still does not change, the game's Steam artwork may not be available in the local cache or its `.desktop` launcher may not match the expected format.

### KDE does not immediately show the new icon

`si` automatically refreshes KDE's application cache using:

```
kbuildsycoca6
```

You should normally not need to run it manually.

### Check whether a game launcher exists

You can inspect your local application launchers with:

```
ls ~/.local/share/applications/
```

## Project Structure

```
steam-kde-icon-sync/
├── si
├── si-clean
├── install.sh
├── uninstall.sh
├── README.md
├── LICENSE
└── .gitignore
```

## Contributing

Contributions, bug reports, and improvements are welcome.

If you find a game that does not work correctly, open an issue with:

* Game name
* Steam App ID
* Linux distribution
* KDE Plasma version
* Relevant terminal output

## License

Steam KDE Icon Sync is released under the MIT License.

See the `LICENSE` file for the full license text.

## Author

Created by ItsARCn.
