# Steam Icon Sync

**Steam Icon Sync** fixes missing Steam game icons on Linux desktops.

Sometimes Steam creates a launcher for a game but gives it the generic Steam icon instead of the game's actual artwork. Steam Icon Sync finds the game's artwork from Steam's local cache and uses it for the launcher.

It uses standard Linux `.desktop` files and icon directories, so it isn't tied to one desktop environment.

## What it does

* 🎮 Fixes Steam games that are stuck with the generic Steam icon
* 🖼️ Uses artwork Steam already has on your system
* 🐧 Works with standard Linux desktop environments
* ↩️ Can undo changes made by `sis`
* 🧠 Keeps track of the launchers it changes
* ⚡ Runs only when you use it
* 🚫 No background service
* 🚫 No daemon
* 🚫 No timer
* 🔒 Doesn't modify your Steam game files

## Install

You don't need to clone the repository.

### curl

```bash
curl -fsSL https://raw.githubusercontent.com/ItsARCn/Steam-Icon-Sync/main/install.sh | bash
```

### wget

```bash
wget -qO- https://raw.githubusercontent.com/ItsARCn/Steam-Icon-Sync/main/install.sh | bash
```

The installer supports both `curl` and `wget`.

It installs:

```text
~/.local/bin/sis
~/.local/bin/sis-clean
```

After installation, you can run `sis` from any terminal.

### Manual install

If you'd rather clone the repository:

```bash
git clone https://github.com/ItsARCn/Steam-Icon-Sync.git
cd Steam-Icon-Sync
./install.sh
```

## Usage

### Fix Steam game icons

Run:

```bash
sis
```

SIS looks through Steam's cached artwork and checks your Steam game launchers for ones still using the generic Steam icon.

For example:

```text
✓ Changed icon: Banana
✓ Changed icon: Allumeria

✓ Done. Updated 2 icon(s).
```

If there is nothing to change:

```text
No icons needed updating.
```

Run `sis` whenever you install a new Steam game or notice that a game is missing its proper icon.

### Undo SIS changes

If you want to undo the changes made by SIS:

```bash
sis-clean
```

Example:

```text
✓ Restored icon: Banana
✓ Restored icon: Allumeria

✓ Done. Restored 2 icon(s).
```

SIS keeps track of the launchers it changes, so `sis-clean` knows exactly what it needs to undo.

## Uninstall

To remove Steam Icon Sync, use `uninstall.sh`.

If you cloned the repository:

```bash
./uninstall.sh
```

You can also uninstall directly from GitHub.

### curl

```bash
curl -fsSL https://raw.githubusercontent.com/ItsARCn/Steam-Icon-Sync/main/uninstall.sh | bash
```

### wget

```bash
wget -qO- https://raw.githubusercontent.com/ItsARCn/Steam-Icon-Sync/main/uninstall.sh | bash
```

The uninstaller removes:

```text
~/.local/bin/sis
~/.local/bin/sis-clean
```

It does **not** remove:

* Steam games
* Steam files
* `.desktop` files
* Icons created by SIS
* Other files outside the SIS installation

If you want to remove the icons and restore the original launcher icons, run:

```bash
sis-clean
```

**before** uninstalling.

If you uninstall without running `sis-clean`, the icons and `.desktop` changes made by SIS will stay as they are.

If you ran `sis-clean` before uninstalling, the icons created by SIS have already been removed and the original launcher icons have been restored.

## How it works

Steam keeps artwork for its games in its local library cache.

When you run `sis`, it:

1. Looks through Steam's artwork cache.
2. Finds a game's `logo.png`.
3. Finds the matching Steam `.desktop` launcher.
4. Checks whether the launcher is using the generic `Icon=steam`.
5. Copies the game's logo to your local icon directory.
6. Changes the launcher to use the new icon.
7. Saves the original icon setting.
8. Refreshes the available desktop application/icon cache.

The copied icons are stored in:

```text
~/.local/share/icons/hicolor/256x256/apps/
```

SIS stores its tracking information here:

```text
~/.local/share/steam-kde-icon-sync/managed
```

## Safe cleanup

SIS doesn't just change files and forget about them.

When `sis` changes a launcher, it records:

* Steam App ID
* The `.desktop` file it changed
* The original icon setting

For example:

```text
Before:
Icon=steam

After sis:
Icon=steam_2923300

After sis-clean:
Icon=steam
```

This means `sis-clean` only undoes changes made by SIS.

It won't go through your icon directory deleting unrelated icons.

## Desktop environments

SIS uses standard Linux `.desktop` files and icon locations, so the main icon-sync process is not KDE-specific.

It is intended to work with major Linux desktop environments, including:

* KDE Plasma
* GNOME
* Xfce
* Cinnamon
* MATE
* LXQt
* LXDE
* Budgie
* COSMIC
* Pantheon
* Other environments using standard `.desktop` files

It can also be used with lightweight window-manager setups where applications are provided through standard `.desktop` entries.

When possible, SIS automatically refreshes the appropriate application or icon cache. If a desktop environment doesn't provide a refresh command, the icon and launcher changes are still made normally.

KDE-specific tools are only used when they are actually available.

## No background process

SIS doesn't sit in the background watching Steam.

There is:

* No systemd service
* No systemd timer
* No daemon
* No periodic scanning
* No constant CPU usage
* No constant RAM usage

Run `sis` when you want to sync your icons.

Run `sis-clean` when you want to undo them.

That's it.

## Requirements

* Linux
* Steam for Linux
* Bash
* A desktop environment or window manager using standard `.desktop` entries
* `curl` or `wget` for the one-line installer

SIS does not require KDE Plasma.

The default Steam library path is:

```text
~/.local/share/Steam
```

## Limitations

The current version looks for Steam artwork in:

```text
~/.local/share/Steam/appcache/librarycache
```

and Steam game launchers in:

```text
~/.local/share/applications
```

Steam's cache structure can change between versions, and not every game necessarily has usable artwork available locally.

## Troubleshooting

### A game still has the Steam icon

Run:

```bash
sis
```

If nothing changes, the game's artwork may not be available in Steam's local cache, or its `.desktop` launcher may not match the format SIS expects.

### The icon doesn't update immediately

SIS automatically tries to refresh the available desktop application/icon cache.

If your desktop environment doesn't provide a refresh command, you may need to restart the application menu or log out and back in.

### Check your Steam launchers

You can see the launchers installed for your user with:

```bash
ls ~/.local/share/applications/
```

## Project structure

```text
Steam-Icon-Sync/
├── sis
├── sis-clean
├── install.sh
├── uninstall.sh
├── README.md
└── LICENSE
```

## Contributing

Found a game that doesn't work with SIS? Feel free to open an issue.

It helps if you include:

* Game name
* Steam App ID
* Linux distribution
* Desktop environment
* Relevant terminal output

Pull requests and improvements are welcome too.

## License

SIS is licensed under the MIT License.

See [LICENSE](/LICENSE) for the full license text.

## Author

Created by ItsARCn.