# 🧠 tmux Cheat Sheet

## 🚀 Starting & Managing Sessions

| Command                         | Description                                |
|---------------------------------|--------------------------------------------|
| `tmux`                          | Start a new session (random name)          |
| `tmux new -s name`              | Start a new session with a custom name     |
| `tmux ls`                       | List all active sessions                   |
| `tmux attach -t name`           | Reattach to a named session                |
| `tmux kill-session -t name`     | Kill a specific session                    |
| `tmux rename-session -t old new`| Rename a session                           |

## 💡 Prefix Key

- The default **prefix** is `Ctrl + B`
- Press that, then the **next key** to issue a command

## 🧱 Windows & Panes

### ➕ Create

| Command                          | Description                                |
|----------------------------------|--------------------------------------------|
| `Ctrl+B` then `C`                | Create a new window                        |
| `Ctrl+B` then `%`                | Split pane **vertically**                  |
| `Ctrl+B` then `"`                | Split pane **horizontally**                |

### 🔁 Navigate

| Command                          | Description                                |
|----------------------------------|--------------------------------------------|
| `Ctrl+B` then `N` or `P`         | Next / Previous window                     |
| `Ctrl+B` then `0`–`9`            | Switch to window by number                 |
| `Ctrl+B` then Arrow Key          | Move between panes                         |
| `Ctrl+B` then vim Keys           | Move between panes (tmuxifier setup)       |
### ❌ Close

| Command                          | Description                                |
|----------------------------------|--------------------------------------------|
| `exit`                           | Close current pane/window (in shell)       |
| `Ctrl+B` then `&`                | Kill current window                        |
| `Ctrl+B` then `X`                | Kill current pane                          |

## 🔄 Resize Panes

| Command                          | Description                                |
|----------------------------------|--------------------------------------------|
| `Ctrl+B` then `:`                | Enter command mode                         |
| Type `resize-pane -D` / `-U` / `-L` / `-R` | Resize down/up/left/right        |

## 📦 Detach & Reattach

| Command                          | Description                                |
|----------------------------------|--------------------------------------------|
| `Ctrl+B` then `D`                | Detach from tmux session                   |
| `tmux attach -t name`            | Reattach to a session                      |

## 🔍 Misc

| Command                          | Description                                |
|----------------------------------|--------------------------------------------|
| `Ctrl+B` then `[`                | Enter **scrollback** mode                  |
| `Ctrl+B` then `:`                | Open command prompt (e.g., `kill-pane`)    |
| `Ctrl+B` then `?`                | List all key bindings                      |

## 📝 Custom Tip

To always start with a named session (e.g., `dev`):

```bash
tmux new -As dev
```
This means:
- Create session `dev` if it doesn’t exist
- Otherwise, attach to it
