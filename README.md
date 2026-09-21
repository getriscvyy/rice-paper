# my everforest dotfiles (hyprland)

## overview
my rice themed around the everforest color palette. includes fastfetch, hypr, kitty, mako, nvim, waybar, wofi, and yazi configs. also features oled saver mode (see **keybinds/default programs**) to disable static ui elements.

## defaults
| program | default |
|---|---|
| terminal | `kitty` |
| file manager | `yazi` |
| launcher | `wofi` |
| browser | `brave` |
| text editor | `nvim` |

## keybinds
`super`: caps lock

### default programs
| keybind | action |
|---|---|
| `super + space` | terminal |
| `super + q` | close active window |
| `super + e` | file manager |
| `super + d` | application launcher |
| `super + f` | browser |
| `super + return` | text editor |
| `super + b` | disable static ui |

### power controls
| keybind | action |
|---|---|
| `super + ctrl + s` | shutdown |
| `super + ctrl + r` | reboot |
| `super + ctrl + z` | suspend (sleep) |
| `super + ctrl + l` | logout |

### navigation & windows (vim binds)
| keybind | action |
|---|---|
| `super + h/j/k/l` | focus left / down / up / right |
| `super + shift + h/j/k/l` | move window left / down / up / right |
| `super + alt + h/j/k/l` | resize window (relative) |
| `super + [0-9]` | focus workspace 1-10 |
| `super + shift + [0-9]` | move window to workspace 1-10 |
| `super + [/]` | focus prev / next workspace |
| `super + shift + [/]` | move window to prev / next workspace |
| `super + tab` | focus next non-empty workspace |
| `super + shift + tab` | move window to next relative workspace |

### screenshot submap
`super + shift + s` to enter submap:
| keybind | action |
|---|---|
| `r` | capture region to clipboard |
| `w` | capture window to clipboard |
| `a` | capture full screen to clipboard |
| `escape` | cancel / exit |

### media & audio
| keybind | action |
|---|---|
| `alt + x` | play / pause |
| `alt + h / l` | prev / next track |
| `alt + j / k` | lower / raise vol |
| `alt + v` | mute |
