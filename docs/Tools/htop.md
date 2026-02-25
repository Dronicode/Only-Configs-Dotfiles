# htop

Launch: `htop` (or `sudo htop` for all processes)

## Navigation

| Shortcut  | Action (mnemonic)               |
| --------- | ------------------------------- |
| ↑ / ↓     | move selection up / down        |
| ← / →     | change sort column (left/right) |
| PgUp/PgDn | scroll process list             |
| Home/End  | jump to top / bottom            |
| Space     | tag/select a process            |
| Ctrl+L    | refresh/redraw                  |

## Core Controls

| Shortcut | Action (mnemonic)                     |
| -------- | ------------------------------------- |
| F1 / h   | help                                  |
| F2 / S   | setup (configure columns, meters)     |
| F3 / /   | \[F]ind (search) by process name      |
| F4       | filter list (type to limit matches)   |
| F5 / t   | tree view (toggle hierarchy)          |
| F6       | choose sort column                    |
| F7 / -   | lower priority (nice +1)              |
| F8 / +   | raise priority (nice -1)              |
| F9 / k   | kill signal menu for selected process |
| F10 / q  | quit                                  |

## Processes & Sorting

- Default sort is CPU; use F6 to change (e.g., MEM%, TIME+, PID).
- Tagged processes (Space) apply to batch operations like F9 kill.
- Color legends show states (running, kernel threads, etc.).

## Display & Meters

- F2 Setup → Columns: enable/disable columns, reorder with arrows.
- F2 Setup → Meters: configure CPU, memory, swap, load averages, disk I/O bars.
- F5 tree view helps inspect parent/child relations.
- Press `H` to hide kernel threads; `K` to show them again.

## Tips

- Use filters (F4) to quickly isolate services by name (e.g., "postgres").
- For multi-core CPUs, per-core meters can be enabled in Setup → Meters.
- Combine search (F3) with Enter to jump to the next match repeatedly.
- Run as root only when you need to renice/kill processes you don't own.
