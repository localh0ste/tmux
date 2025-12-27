---
## How to Install ?
```
chmod +x install.sh
./install.sh
```
---
#Tmux Command

## Window Management

| Shortcut | Description |
|--------|-------------|
| Ctrl + Space + `+` | Split window horizontally |
| Ctrl + Space + `-` | Split window vertically |
| Ctrl + Space + `c` | Create a new window |
| Ctrl + Space + `n` | Move to next window |
| Ctrl + Space + `p` | Move to previous window |
| Ctrl + Space + `,` | Rename current window |

---

## Pane Navigation (Change Pane)

Use arrow keys after the prefix to switch between panes:

| Shortcut | Description |
|--------|-------------|
| Ctrl + Space + `→` | Move to right pane |
| Ctrl + Space + `←` | Move to left pane |
| Ctrl + Space + `↑` | Move to upper pane |
| Ctrl + Space + `↓` | Move to lower pane |

---

## Requirements

- Terminal multiplexer such as **tmux**
- Prefix key configured as `Ctrl + Space`

Example `.tmux.conf` configuration:

```conf
unbind C-b
set-option -g prefix C-Space
bind-key C-Space send-prefix
