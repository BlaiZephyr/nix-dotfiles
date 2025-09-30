# Doom Emacs File Explorer Cheatsheet

## 🗂️ **What is Dired?**

Dired (Directory Editor) is Emacs' built-in file manager that allows you to navigate, manage, and manipulate files and directories efficiently.
- Browse directories with keyboard navigation
- Mark, copy, move, and delete files
- Execute commands on multiple files at once
- Integrate with other Emacs tools and buffers

## 📋 **Requirements**
- Doom Emacs (Dired is built-in)
- **Treemacs**: Must be enabled in `~/.doom.d/init.el` (uncomment `treemacs` line)
- Optional tools for enhanced functionality:
  - `rsync` - Fast file synchronization and copying
  - `fd` or `find` - Enhanced file finding
  - `rg` (ripgrep) or `ag` (the_silver_searcher) - Fast text search
  - `exa` or `lsd` - Enhanced directory listings
  - `trash-cli` - Safe file deletion to trash
  - `zip`/`unzip`, `tar`, `gzip` - Archive handling

## ⌨️ **Opening File Explorers**

### **Dired (Built-in File Manager):**
- `SPC .` - **Open Dired** in current directory
- `SPC f d` - **Find directory** (open Dired in specific path)
- `C-x d` - **Open Dired** (classic Emacs binding)

### **Project File Navigation:**
- `SPC SPC` - **Find file** in project
- `SPC f f` - **Find file** anywhere
- `SPC f r` - **Recent files**
- `SPC p f` - **Find file** in project

### **Tree-style Explorers:**
- `SPC o p` - **Toggle project sidebar** (Treemacs)
- `SPC f t` - **Find file** in tree

## 🧭 **Navigation in Dired**

### **Basic Movement:**
- `j/k` or `n/p` - **Move up/down** between files
- `h` - **Go up** one directory (parent)
- `l` or `RET` - **Enter directory** or open file
- `^` - **Go to parent directory**
- `g` - **Refresh** directory listing

### **Jumping Around:**
- `gg` - **Go to top** of listing
- `G` - **Go to bottom** of listing
- `/` - **Search** for file/directory name
- `SPC s s` - **Search within** directory

### **File Information:**
- `(` - **Toggle details** (show/hide file info)
- `s` - **Sort** files (by name, date, size)
- `C-h m` - **Show help** for current mode

## 📁 **File Operations**

### **Opening Files:**
- `RET` - **Open file** in current window
- `o` - **Open file** in other window
- `C-o` - **Open file** in other window (keep cursor in Dired)
- `v` - **View file** (read-only)
- `f` - **Find file** (same as RET)

### **Creating Files & Directories:**
- `+` - **Create directory**
- `SPC f c` - **Create file** (when in Dired buffer)
- `C-x C-f` - **Find/create file** (from Dired)

## 🏷️ **Marking Files**

### **Basic Marking:**
- `m` - **Mark file** for operations
- `u` - **Unmark file**
- `U` - **Unmark all** files
- `t` - **Toggle marks** (mark unmarked, unmark marked)
- `* %` - **Mark by regex** pattern

### **Quick Marking:**
- `* .` - **Mark by extension** (e.g., *.txt)
- `* /` - **Mark directories**
- `* @` - **Mark symlinks**
- `* *` - **Mark executables**

### **Advanced Marking:**
- `% m` - **Mark files** matching regex
- `% d` - **Mark for deletion** files matching regex
- `* c` - **Change marks** (change one mark to another)

## ✂️ **File Management Operations**

### **Copy, Move, Delete:**
- `C` - **Copy** marked files (or file under cursor)
- `R` - **Rename/Move** marked files
- `D` - **Delete** marked files immediately
- `d` - **Mark for deletion** (use `x` to execute)
- `x` - **Execute deletions** (delete files marked with `d`)

### **Deletion Options:**
- `d` then `x` - **Safe deletion** (mark first, then execute)
- `D` - **Immediate deletion** (bypass mark step)
- **Trash integration**: If `trash-cli` is installed, files go to trash instead of permanent deletion

### **Advanced Operations:**
- `Z` - **Compress/uncompress** files (uses `gzip`, `zip`, `tar` automatically)
- `A` - **Search** in marked files (uses `grep` or `rg` if available)
- `Q` - **Query replace** in marked files
- `!` - **Run shell command** on marked files
- `&` - **Run async shell command** on marked files

## 📋 **Copying & Moving**

### **Copy Operations:**
- `C` - **Copy files** (prompts for destination)
- Works with marked files or single file under cursor
- Uses `rsync` if available for faster, resumable copying
- Supports copying to different drives/partitions

### **Move/Rename Operations:**
- `R` - **Rename/Move** files
- Can rename single files or move multiple marked files
- Supports moving across directories

### **Tips for Copy/Move:**
- Mark multiple files first, then use `C` or `R`
- Tab completion works for destination paths
- Use relative paths (`.`, `..`) for quick navigation

## 🔍 **Search & Filter**

### **Finding Files:**
- `/` - **Search** file names in current listing
- `n/N` - **Next/previous** search match

### **Enhanced Search (with external tools):**
- `A` - **Search inside files** (uses `rg` > `ag` > `grep` in priority order)
- Much faster with `ripgrep` or `the_silver_searcher`
- Supports regex patterns and file type filtering

### **Filtering Display:**
- `(` - **Toggle** detailed view
- `s` - **Sort** by different criteria
- `C-u s` - **Sort** with custom options

### **Content Search:**
- `A` - **Search inside** marked files
- `Q` - **Query replace** across marked files

## 🔧 **Advanced Features**

### **Wdired (Writable Dired):**
- `C-x C-q` - **Edit filenames** directly (like renaming)
- Edit filenames as text, then `C-c C-c` to apply changes
- `C-c C-k` to cancel edits

### **Multiple Windows:**
- `o` - **Open in other window**
- `C-o` - **Display in other window** (stay in Dired)
- `2` - **Split window** vertically for two Dired views

### **Subdirectories:**
- `i` - **Insert subdirectory** in same buffer
- `$` - **Hide/show** subdirectory contents
- `M-$` - **Hide all** subdirectories

## 📊 **File Comparison**

### **Diff Operations:**
- `=` - **Diff file** with another
- `M-=` - **Diff** marked files against each other
- Works with external diff tools

## 🗜️ **Archive Operations**

### **Compression & Archives:**
- `Z` - **Compress/decompress** automatically detects format
- Supports: `.gz`, `.zip`, `.tar`, `.tar.gz`, `.tar.xz`, `.7z`
- Uses appropriate tools: `gzip`, `zip`, `tar`, `7z`

### **Archive Viewing:**
- Open `.zip`, `.tar`, etc. files directly to browse contents
- Extract specific files from archives

## 🎛️ **Customization & Settings**

### **View Options:**
- `(` - **Toggle** between simple and detailed view
- `s` - **Cycle** through sort orders (name, date, size)
- Enhanced listings with `exa` or `lsd` if available

### **Useful Settings:**
- Dired reuses buffers by default in Doom
- Auto-refresh on file changes
- Integration with Evil mode keybindings

## ⚡ **Treemacs (Tree Explorer)**

### **Basic Treemacs:**
- `SPC o p` - **Toggle** Treemacs sidebar
- `j/k` - **Navigate** up/down in tree
- `RET` - **Open file** or expand/collapse directory
- `TAB` - **Expand/collapse** directory

### **Treemacs File Operations:**
- `cf` - **Create file**
- `cd` - **Create directory**
- `R` - **Rename**
- `d` - **Delete**
- `yy` - **Copy** path to clipboard

## 🚀 **Quick Start Workflow**

### **Basic File Management:**
1. **Press `SPC .`** - Open Dired in current directory
2. **Navigate with `j/k`** - Move between files
3. **Mark files with `m`** - Select multiple files
4. **Use `C` to copy** or `R` to move/rename
5. **Press `g`** to refresh when done

### **Efficient File Operations:**
1. **Mark multiple files** with `m`
2. **Execute batch operations** (`C` for copy, `R` for move)
3. **Use `!`** to run shell commands on marked files
4. **Toggle details with `(`** for more/less information

## 📚 **Essential Keybind Summary**

| Action | Key | Description |
|--------|-----|-------------|
| Open Dired | `SPC .` | Open file explorer |
| Navigate | `j/k` | Move up/down |
| Enter/Open | `RET` or `l` | Open file/directory |
| Parent Dir | `h` or `^` | Go up one directory |
| Mark | `m` | Mark file for operations |
| Copy | `C` | Copy marked files |
| Move/Rename | `R` | Move or rename files |
| Delete | `d` then `x` | Mark for deletion, execute |
| Create Dir | `+` | Create new directory |
| Compress | `Z` | Compress/decompress |
| Search Files | `A` | Search inside files |
| Refresh | `g` | Refresh directory listing |
| Help | `?` | Show available commands |

## 🔧 **Troubleshooting**

### **Common Issues:**
- **Dired buffer not updating?** Press `g` to refresh
- **Can't see file details?** Press `(` to toggle detailed view
- **Operations feel slow?** Use marking (`m`) for batch operations
- **Wrong sort order?** Press `s` to cycle through sort options

### **Performance Tips:**
- Install `fd` for faster file finding
- Install `rg` (ripgrep) for faster text search
- Use `rsync` for efficient file copying
- Consider `exa` or `lsd` for enhanced directory listings

### **Getting Help:**
- `?` - **Context help** in any Dired buffer
- `C-h m` - **Mode-specific help**
- `SPC h d f dired` - **Full Dired documentation**

## 📋 **Comparison: Dired vs Treemacs**

### **Use Dired when:**
- Managing multiple files at once
- Need detailed file information
- Performing batch operations
- Working with file permissions/ownership

### **Use Treemacs when:**
- Quick project overview
- Simple file navigation
- Prefer visual tree structure
- Need persistent sidebar

## 🛠️ **External Tool Integration**

### **Recommended Tools:**
- **`rsync`** - Fast, reliable file copying with resume capability
- **`ripgrep` (rg)** - Extremely fast text search, much faster than grep
- **`fd`** - Fast alternative to find with better defaults
- **`exa`** - Modern replacement for ls with colors and git integration
- **`trash-cli`** - Safe deletion to trash instead of permanent removal
- **`7z`** - Handle 7zip archives and other compression formats

### **Installation (Debian/Ubuntu):**
```bash
sudo apt install rsync ripgrep fd-find exa trash-cli p7zip-full
```

## 🎯 **Pro Tips**

- **Batch operations**: Mark files first (`m`), then execute operations
- **Quick navigation**: Use `/` to search for files by name
- **Edit filenames**: Use `C-x C-q` for Wdired mode to rename multiple files
- **Shell integration**: Use `!` to run shell commands on files
- **Multiple directories**: Use `i` to show subdirectories in same buffer
- **Safe deletion**: Install `trash-cli` to send files to trash instead of permanent deletion
- **Fast search**: Install `ripgrep` for lightning-fast text search in files

Dired provides a comprehensive file management experience that integrates well with external Linux tools, making file operations both efficient and powerful.
