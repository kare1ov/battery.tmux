# battery.tmux

A simple and minimal **battery status plugin** for [tmux](https://github.com/tmux/tmux). Displays battery level and an icon in the tmux status bar.

Inspired by [tmux-battery](https://github.com/tmux-plugins/tmux-battery).

## Features
- Shows battery **level** and **icon**
- Works on **macOS** (`pmset`) and **Linux** (`acpi`)
- Easy to integrate with any tmux configuration

## Installation

### Using [TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm) **(Recommended)**
Add this to your `tmux.conf`:

```sh
set -g @plugin 'kare1ov/battery.tmux'
```

Then reload your config (`prefix + I`) to install.

### Manual Installation
Clone the repo:
```sh
git clone https://github.com/kare1ov/battery.tmux.git ~/clone/path/
```

Then add this to your `tmux.conf`:
```sh
run-shell ~/clone/path/battery.tmux/init.tmux
```

Reload TMUX environment (type this in terminal):
```sh
tmux source-file path/to/tmux.conf
```

## Usage
Add any of supported format strings to `status-left` or `status-right`.

#### Format strings
| Placeholder | Description |
|-------------|-------------|
| `#{battery_icon}` | Displays the battery icon |
| `#{battery_level}` | Shows battery level |

#### Example config
```sh
# Install TPM (Tmux Plugin Manager)
set -g @plugin 'tmux-plugins/tpm'

# Install battery.tmux plugin
set -g @plugin 'kare1ov/battery.tmux'

# Configure status-right to display battery level with color indicators
# If battery level is greater than 15%, display in green, otherwise in red
set -g status-right "#{?#{e|>:#{battery_level},15},#[fg=green],#[fg=red]} #{battery_icon} #{battery_level}%% "
```

## Uninstalling
If installed via TPM, remove the plugin line from `tmux.conf` and run (`prefix + alt + u`).

For manual installation, remove the `run-shell` line from `tmux.conf` and delete the cloned directory:
```sh
rm -rf /path/to/plugin/battery.tmux
```

## License
This project is licensed under the [MIT License](https://github.com/kare1ov/battery.tmux/blob/main/LICENSE).

