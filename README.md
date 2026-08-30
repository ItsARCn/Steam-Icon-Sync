
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
````

Example:

```text
✓ Changed icon: Banana
✓ Changed icon: Allumeria

✓ Done. Updated 2 icon(s).
```

If nothing needs changing:

```text
No icons needed updating.
```

### `si-clean`

Undoes changes made by `si`.

```bash
si-clean
```

It restores the original icon setting and removes only the icon files created by `si`.

Example:

```text
✓ Restored icon: Banana
✓ Restored icon: Allumeria

✓ Done. Restored 2 icon(s).
```

`si-clean` uses a small tracking file to know exactly which launchers were modified by `si`. It does not blindly remove every `steam_<appid>` icon.

## How It Works

Steam stores game artwork in its local library cache.

When you run `si`, it:

1. Scans Steam's library artwork cache.
2. Finds each game's `logo.png`.
3. Finds the matching Steam `.desktop` launcher.
4. Checks whether the launcher currently uses `Icon=steam`.
5. Copies the artwork to the local KDE icon directory.
6. Changes the launcher to use a game-specific icon.
7. Records the original icon setting.
8. Refreshes KDE's application cache.

The tracking data is stored at:

```text
~/.local/share/steam-kde-icon-sync/managed
```

## Installation

### Quick install with curl

```bash
curl -fsSL https://raw.githubusercontent.com/ItsARCn/steam-kde-icon-sync/main/install.sh | bash
```

### Quick install with wget

```bash
wget -qO- https://raw.githubusercontent.com/ItsARCn/steam-kde-icon-sync/main/install.sh | bash
```

The installer automatically uses `curl` if available, otherwise `wget`.

It installs:

```text
~/.local/bin/si
~/.local/bin/si-clean
```

### Manual installation

Clone the repository:

```bash
git clone https://github.com/ItsARCn/steam-kde-icon-sync.git
cd steam-kde-icon-sync
./install.sh
```

## Usage

After installing, simply run:

```bash
si
```

Run it whenever:

* You install a new Steam game
* A game has a generic Steam icon
* Steam downloads new artwork
* A game's KDE icon needs fixing

There is intentionally no automatic background process. The tool only runs when you execute `si`.

## Uninstallation

Run:

```bash
./uninstall.sh
```

The uninstaller removes the `si` and `si-clean` commands but does **not** remove icons or modify your `.desktop` files.

Your existing changes are left untouched.

If you want to undo icons created by `si`, run:

```bash
si-clean
```

before uninstalling.

## Requirements

* Linux
* KDE Plasma
* Steam for Linux
* Bash
* `kbuildsycoca6`
* `curl` or `wget` for the quick installer

The default Steam installation location is:

```text
~/.local/share/Steam
```

## Limitations

The tool currently expects Steam's library cache at:

```text
~/.local/share/Steam/appcache/librarycache
```

Games must also have a corresponding Steam `.desktop` launcher in:

```text
~/.local/share/applications
```

Steam's cache structure and artwork availability may vary between installations and Steam versions.

## Safety

`si` only changes Steam game launchers that:

* contain the matching `steam://rungameid/<appid>` command
* currently use `Icon=steam`

`si-clean` only operates on changes recorded by `si`.

The tool does not modify Steam's installation files.

## Contributing

Issues, improvements, and pull requests are welcome.

If you find a Steam game that isn't handled correctly, open an issue with:

* Game name
* Steam App ID
* Linux distribution
* KDE Plasma version
* Relevant terminal output

## License

This project is licensed under the MIT License.

```

### One important thing

There's **one mismatch** we need to fix after this: our current `uninstall.sh` only removes `si`, while this README says it removes **both `si` and `si-clean`**.

So **don't worry about that yet**. Commit this README, then we'll fix `uninstall.sh` to match it. After that, `.gitignore` is the last small file.
```
