# Vim Concepts: The Vim Way of Thinking

This guide explains fundamental Vim/Neovim concepts to help you understand how to work efficiently with the editor.

---

## Core Philosophy

Vim is built around a few key principles:

1. **Modal editing** - Different modes for different tasks (Normal, Insert, Visual, Command)
2. **Composable commands** - Combine operators, motions, and text objects
3. **Minimal hand movement** - Keep your hands on the home row
4. **Text as a language** - Commands that read like sentences

The Vim way is to stay in Normal mode as much as possible, making quick edits and navigating efficiently.

---

## Buffers, Windows, and Tabs

Understanding these three concepts is crucial to using Vim effectively.

### Buffers

**What is a buffer?**

- A buffer is a file loaded into memory
- When you open a file, Neovim creates a buffer for it
- Buffers exist independently of what you see on screen
- You can have 50 buffers open but only see 2 on screen

**Think of buffers as:** Your open files list (like browser tabs, but invisible until displayed)

**When to use buffers:**

- Working with multiple files in a project (most common workflow)
- Quick switching between files you're actively editing
- Keeping context without cluttering your screen

**Managing buffers:**

```
:e filename         Open file in current window
:badd filename      Add file to buffer list without opening
:ls or :buffers     List all buffers
:b <number>         Switch to buffer by number
:b <name>           Switch to buffer by name (tab completion works!)
:bnext or :bn       Next buffer
:bprev or :bp       Previous buffer
:bdelete or :bd     Delete buffer (close file)
:bdelete!           Force delete (discard unsaved changes)
:%bd                Delete all buffers
```

**Your custom shortcuts:**

- `<Tab>` - Next buffer (moves right visually in bufferline)
- `<S-Tab>` - Previous buffer (moves left visually in bufferline)
- `<leader>x` - Close buffer (smart close that prevents layout issues)
- `<leader>b` - New empty buffer
- `<leader>sb` - Search/select buffer with Telescope
- `<leader>1-9` - Jump directly to buffer number (if enabled)

**Note:** Your buffer numbers are now visible in the bufferline at the top! The number shows the buffer ID, which you can use with `:b <number>` to jump directly to a buffer.

**Understanding buffer display:**

- **Buffer number:** The ID shown in the bufferline (e.g., "3 filename.txt")
- **Buffer name:** Usually the filename (e.g., "config.lua", "README.md")
- **Full path:** The complete file path (shown in `:ls` or `:buffers`)

**Quick jumps:**

- Type `:b3` and press Enter to jump to buffer 3
- Type `:b config` and press Tab for autocomplete
- Look at the bufferline numbers to see which buffer to jump to

**Typical workflow:**

```
1. Open your project root in Neovim
2. Use <leader>sf to find and open files (adds to buffers)
3. Use <Tab>/<S-Tab> to cycle through open files
4. Use <leader>x to close files you're done with
5. Your buffer list grows and shrinks as you work
```

---

### Windows (Splits/Panes)

**What is a window?**

- A window is a viewport that displays a buffer
- Windows are also called "splits" or "panes"
- One buffer can be shown in multiple windows
- Multiple windows let you see different files (or different parts of the same file) simultaneously

**Think of windows as:** Your screen layout or workspace arrangement

**When to use windows:**

- Viewing related files side-by-side (e.g., header and implementation)
- Referencing one file while editing another
- Comparing code across files
- Viewing different parts of the same long file
- Having a terminal open alongside your code

**Types of splits:**

- **Vertical split** - Side by side (left/right)
- **Horizontal split** - Top and bottom (up/down)

**Managing windows:**

```
:split or :sp       Horizontal split (same file)
:vsplit or :vsp     Vertical split (same file)
:split filename     Horizontal split with different file
:vsplit filename    Vertical split with different file
:new                New horizontal split with empty buffer
:vnew               New vertical split with empty buffer
:only               Close all windows except current
:close              Close current window
:q                  Quit (close) current window

Ctrl-w s            Horizontal split
Ctrl-w v            Vertical split
Ctrl-w q            Close current window
Ctrl-w o            Close all but current window
Ctrl-w w            Cycle to next window
Ctrl-w hjkl         Navigate between windows
Ctrl-w HJKL         Move window to far left/down/up/right
Ctrl-w =            Make all windows equal size
Ctrl-w _            Maximize height
Ctrl-w |            Maximize width
Ctrl-w +/-          Increase/decrease height
Ctrl-w >/<          Increase/decrease width
```

**Your custom shortcuts:**

- `<leader>v` - Vertical split
- `<leader>h` - Horizontal split
- `<leader>se` - Equalize window sizes
- `<leader>xs` - Close current split
- `<C-h/j/k/l>` - Navigate between splits (simplified)
- `<C-Up/Down/Left/Right>` - Resize splits

**Typical workflow:**

```
1. Start with one window
2. Open a related file: <leader>v then <leader>sf (find file)
3. Navigate with <C-h/j/k/l>
4. When done comparing, use :q or <leader>xs to close split
5. Back to single window with your main file
```

**Common patterns:**

- **Two vertical splits:** Main code + test file
- **Three vertical splits:** Model + View + Controller
- **Horizontal + vertical:** Code on top, terminal on bottom
- **Reference layout:** Small split with docs, large split for coding

---

### Tabs

**What is a tab?**

- A tab is a collection of windows (a layout)
- Each tab can have its own arrangement of splits
- Tabs are like workspaces or perspectives
- The same buffer can be open in multiple tabs

**Think of tabs as:** Different desk arrangements or project contexts

**When to use tabs:**

- Separating different contexts (e.g., frontend tab, backend tab, config tab)
- Different features you're working on
- Preserving complex split layouts
- Different projects within the same Neovim session
- **Use sparingly** - most Vim users prefer buffers + windows

**Managing tabs:**

```
:tabnew             Open new tab with empty buffer
:tabnew filename    Open new tab with file
:tabe filename      Edit file in new tab
:tabclose or :tabc  Close current tab
:tabonly            Close all tabs except current
:tabnext or :tabn   Next tab
:tabprev or :tabp   Previous tab
:tabfirst           First tab
:tablast            Last tab
:tabs               List all tabs
:tabmove 0          Move tab to first position
:tabmove            Move tab to last position
```

**Your custom shortcuts:**

- `<leader>to` - Open new tab
- `<leader>tx` - Close tab
- `<leader>tn` - Next tab
- `<leader>tp` - Previous tab

**Typical workflow (if using tabs):**

```
1. Start with one tab for main feature
2. <leader>to for a new context (e.g., documentation)
3. Set up splits in each tab as needed
4. <leader>tn/tp to switch between contexts
5. <leader>tx when done with a context
```

**Important note:** Most experienced Vim users use tabs sparingly or not at all. Buffers + windows are usually sufficient and more flexible.

---

## Closing Things: A Decision Tree

### "I want to close this file"

**Use:** `<leader>x` or `:bd`

- Closes the buffer (file)
- Window stays open (might show another buffer or be empty)
- Other windows remain unchanged

### "I want to close this split/pane"

**Use:** `:q` or `<leader>xs` (for `:close`)

- Closes the window
- Buffer remains in memory (can open in another window)
- Other windows remain

### "I want to close this file AND the split"

**Use:** `:q`

- First use `<leader>x` to close buffer, then `:q` to close window
- Or just `:q` if you don't care about the buffer

### "I want to close everything in this tab"

**Use:** `:only` then `<leader>x` for each buffer

- `:only` closes all windows except current
- Then clean up buffers as needed

### "I want to close this tab"

**Use:** `<leader>tx` or `:tabclose`

- Closes the entire tab and its window layout
- Buffers remain in memory

### "I want to exit Neovim"

**Use:** `:qa` (quit all)

- `:qa` - Quit all (fails if unsaved changes)
- `:qa!` - Force quit all (discard changes)
- `:wqa` - Write all and quit all

---

## Recommended Workflows

### Workflow 1: Buffer-Centric (Most Common)

**Best for:** Most development work, single project

```
1. Open Neovim in project root
2. Use <leader>sf to open files (creates buffers)
3. Use <Tab>/<S-Tab> to switch between files
4. Occasionally use <leader>v to split for comparison
5. Close splits with :q when done comparing
6. Close unneeded buffers with <leader>x
```

**Advantages:**

- Simple and clean
- Low cognitive overhead
- Fast file switching
- Works great with fuzzy finder (Telescope)

**Your buffer list is your "working set"**

---

### Workflow 2: Window-Centric

**Best for:** Working with related files simultaneously

```
1. Open main file
2. <leader>v to create vertical split
3. <leader>sf to open related file in split
4. Use <C-h/l> to move between splits
5. Both files visible at all times
6. Use :q to close splits when done
```

**Advantages:**

- See multiple files at once
- Great for reference/comparison
- Good for TDD (test + implementation)

**Common layouts:**

- Two files side-by-side
- Three column layout (rare but useful)
- Code + terminal horizontal split

---

### Workflow 3: Tab-Based (Advanced/Optional)

**Best for:** Multiple contexts or complex layouts

```
1. Tab 1: Feature A (3-way split with related files)
2. Tab 2: Feature B (2-way split)
3. Tab 3: Documentation (1 window)
4. Switch between contexts with <leader>tn/tp
```

**Advantages:**

- Separate contexts
- Preserve complex layouts
- Good for task switching

**Disadvantages:**

- More complex
- Easy to lose track
- Most people don't need this

---

## Mental Model Summary

Think of it this way:

**Buffers = Your open files** (in memory, not always visible)
↓
**Windows = Your viewports** (what you see on screen)
↓
**Tabs = Your workspaces** (collection of window arrangements)

**Analogy:**

- **Buffers** are like documents on your desk (might be in a pile, not all visible)
- **Windows** are like having multiple monitors (showing different documents)
- **Tabs** are like different desks (each with its own monitor setup)

---

## Common Confusions Clarified

### "Why does my file disappear when I close it?"

You closed the **window** (`:q`) not the **buffer** (`<leader>x`). The file is still in memory, open it again with `:b <filename>` or `<Tab>` through buffers.

### "Why can't I switch to my file with <Tab>?"

It's not in the **buffer list**. Open it with `<leader>sf` or `:e filename` first.

### "Why do I have the same file open twice?"

You opened the same **buffer** in two **windows** (splits). This is intentional - useful for viewing different parts of a large file.

### "Should I use tabs?"

Probably not at first. Master buffers and windows first. Tabs are for advanced workflows with multiple contexts.

---

## Best Practices

1. **Use buffers for file switching** - This is the Vim way

   - Keep your frequently-used files in the buffer list
   - Use `<Tab>`/`<S-Tab>` or Telescope to switch

2. **Use windows for simultaneous viewing** - When you need to see multiple things

   - Split when comparing or referencing
   - Close splits when done to reduce clutter

3. **Use tabs sparingly** - Only for truly separate contexts

   - Different features
   - Different projects
   - Complex layouts worth preserving

4. **Close things appropriately:**

   - Done with file? `<leader>x` (close buffer)
   - Done with split? `:q` (close window)
   - Done with context? `<leader>tx` (close tab)
   - Done with session? `:qa` (quit all)

5. **Don't let buffers accumulate**

   - Close buffers you're done with using `<leader>x`
   - Use `<leader>sb` to see what's open
   - Periodically clean up with `:ls` to review

6. **Keep your layout simple**

   - One or two splits is usually enough
   - Too many splits = cognitive overload
   - If you need more, consider tabs

7. **Trust your buffer closing**
   - `<leader>x` preserves window layout automatically
   - Splits and side panels stay intact when closing buffers
   - Think of it as a permanent sidebar
   - Close other windows around it, not it directly

---

## Quick Reference

| Want to...       | Command       | Your Shortcut       |
| ---------------- | ------------- | ------------------- |
| Open file        | `:e filename` | `<leader>sf`        |
| Switch file      | `:b name`     | `<Tab>` / `<S-Tab>` |
| Close file       | `:bd`         | `<leader>x`         |
| List files       | `:ls`         | `<leader>sb`        |
|                  |               |                     |
| Split vertical   | `:vsp`        | `<leader>v`         |
| Split horizontal | `:sp`         | `<leader>h`         |
| Close split      | `:q`          | `<leader>xs`        |
| Only this split  | `:only`       | -                   |
| Navigate splits  | `<C-w>hjkl`   | `<C-hjkl>`          |
|                  |               |                     |
| New tab          | `:tabnew`     | `<leader>to`        |
| Close tab        | `:tabc`       | `<leader>tx`        |
| Next tab         | `:tabn`       | `<leader>tn`        |
| Prev tab         | `:tabp`       | `<leader>tp`        |
|                  |               |                     |
| Quit Neovim      | `:qa`         | -                   |
| Quit and save    | `:wqa`        | -                   |
| Force quit       | `:qa!`        | -                   |

---

## Learning Path

**Week 1: Master Buffers**

- Use only `<Tab>`/`<S-Tab>` and `<leader>sf`
- Get comfortable with buffer-based workflow
- Don't use splits or tabs yet

**Week 2: Add Splits**

- Start using `<leader>v` when you need side-by-side
- Practice `<C-hjkl>` navigation
- Get comfortable closing splits with `:q`

**Week 3: Refine Your Workflow**

- Use `<leader>e` for file tree when needed
- Master closing the right thing at the right time
- Keep your buffer list clean

**Week 4+: Advanced (Optional)**

- Experiment with tabs if you have multiple contexts
- Learn complex window manipulation
- Develop your personal workflow preferences

---

## Remember

- **Buffers are your friends** - Use them for everything
- **Windows are temporary** - Create and destroy as needed
- **Tabs are optional** - Many users never touch them
- **The Neo-tree glitch** - It's about windows, not buffers
- **When in doubt** - Use `:q` to close splits, `<leader>x` to close files

The Vim way takes time to internalize, but once it clicks, you'll find it incredibly efficient. Start simple, build muscle memory, and gradually add complexity as needed.
