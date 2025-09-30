# Top 10 Things New Doom Emacs Users Should Know

## 🚀 **Getting Started with Doom Emacs**

Welcome to Doom Emacs! Here are the 10 most essential things every new user
should master to get productive quickly.

---

## 1. 🗝️ **Master the Leader Key: `SPC`**

**The Space key is your gateway to everything in Doom Emacs.**

- `SPC` is called the "leader key" - it opens menus for almost every action
- After pressing `SPC`, you'll see helpful hints showing available commands
- Commands are organized logically: `SPC f` for files, `SPC g` for git, `SPC p`
  for projects

**Essential starter commands:**

- `SPC f f` - Find/open files
- `SPC f s` - Save current file
- `SPC q q` - Quit Emacs
- `SPC h` - Help menu (very important!)

**Pro Tip:** If you forget what comes next, just press `SPC` and wait - Doom
will show you the options!

---

## 2. 📁 **Navigate Files Like a Pro**

**File navigation is fundamental to productivity.**

- `SPC .` - **Open file explorer** (Dired) in current directory
- `SPC f f` - **Find file** anywhere on your system
- `SPC f r` - **Recent files** you've worked on
- `SPC SPC` - **Find file in current project** (super useful!)

📋 _See the complete guide: `emacs.file-explorer.cheatsheet.md`_

**Quick workflow:**

1. Open your project directory in terminal
2. Start Emacs: `emacs` or `doom run`
3. Use `SPC .` to browse files or `SPC SPC` to quickly find files

---

## 3. ⌨️ **Understand Evil Mode (Vim Keybindings)**

**Doom Emacs uses Vim-style keybindings by default.**

**Basic movement (in Normal mode):**

- `h j k l` - Left, down, up, right
- `w` - Jump to next word
- `b` - Jump back one word
- `gg` - Go to top of file
- `G` - Go to bottom of file

**Mode switching:**

- `i` - Enter Insert mode (to type text)
- `ESC` - Return to Normal mode
- `v` - Visual mode (to select text)

**If you're not familiar with Vim:** Don't panic! You can learn gradually. The
basics above will get you started.

---

## 4. 🔍 **Search and Replace Efficiently**

**Finding and changing text is a daily task.**

- `/` - Search forward in current buffer
- `?` - Search backward in current buffer
- `n/N` - Next/previous search result
- `SPC s s` - Search in current buffer (interactive)
- `SPC s p` - Search in entire project
- `SPC s r` - Search and replace in current buffer

**For project-wide search:** `SPC s p` is incredibly powerful for finding code
across your entire project.

---

## 5. 🗂️ **Work with Buffers and Windows**

**Buffers are open files, windows are how you view them.**

**Buffer management:**

- `SPC b b` - Switch between open buffers
- `SPC b k` - Kill (close) current buffer
- `SPC b s` - Save current buffer

**Window management:**

- `SPC w v` - Split window vertically
- `SPC w s` - Split window horizontally
- `SPC w c` - Close current window
- `SPC w w` - Switch between windows
- `C-h j/k/h/l` - Navigate between windows (Vim-style)

**Think of it this way:** You can have many files open (buffers) but only see
some of them at once (windows).

---

## 6. 🛠️ **Configure and Customize Doom**

**Doom is highly configurable, but start simple.**

**Key files to know about:**

- `~/.doom.d/config.el` - Your personal configuration
- `~/.doom.d/init.el` - Enable/disable Doom modules
- `~/.doom.d/packages.el` - Add extra packages

**Essential commands:**

- `SPC h r r` - Reload Doom configuration
- `SPC h d h` - Doom help and documentation
- `doom doctor` - Check for configuration issues (run in terminal)
- `doom upgrade` - Update Doom (run in terminal)

**Start small:** Don't try to customize everything at once. Use Doom's defaults
first, then gradually tweak things.

---

## 7. 📝 **Master Text Editing Basics**

**Essential editing commands that work in any mode.**

**In Normal mode (Evil):**

- `x` - Delete character under cursor
- `dd` - Delete entire line
- `yy` - Copy (yank) entire line
- `p` - Paste after cursor
- `u` - Undo
- `C-r` - Redo

**In Insert mode:**

- `C-w` - Delete word backward
- `C-u` - Delete to beginning of line

**Selection and manipulation:**

- `v` - Start visual selection
- `V` - Select entire line
- `d` - Delete selected text
- `y` - Copy selected text

---

## 8. 💻 **Use Code Completion and Language Features**

**Doom comes with excellent code support out of the box.**

**Auto-completion:**

- Just start typing - completions appear automatically
- `TAB` - Accept completion
- `C-n/C-p` or `j/k` - Navigate completion options

**Code navigation:**

- `gd` - Go to definition
- `gr` - Find references
- `K` - Show documentation
- `SPC c a` - Code actions (refactor, fix, etc.)

📋 _See the complete guide: `emacs.code-completion.cheatsheet.md`_

**Languages supported:** Most popular languages work out of the box (Python,
JavaScript, C/C++, Rust, Go, etc.)

---

## 9. 📚 **Use Built-in Help System**

**Doom has excellent built-in documentation.**

- `SPC h` - **Main help menu**
- `SPC h d h` - **Doom-specific help**
- `SPC h k` - **Describe key** (what does this key do?)
- `SPC h f` - **Describe function**
- `SPC h v` - **Describe variable**
- `C-h m` - **Show help for current mode**

**When you're lost:** Press `SPC h` and explore. The help system is
comprehensive and always available.

**Pro Tip:** If you press a key combination and don't know what happened, use
`SPC h l` to see recent commands.

---

## 10. 🔧 **Learn Git Integration (Magit)**

**Magit is one of the best Git interfaces available anywhere.**

- `SPC g g` - Open Magit status (your main Git command!)
- `s` - Stage files or hunks
- `c c` - Commit changes
- `P P` - Push to remote
- `F F` - Pull from remote

📋 _See the complete guide: `emacs.magit.cheatsheet.md`_

**Basic workflow:**

1. `SPC g g` - See what's changed
2. `s` on files to stage them
3. `c c` to commit (write message, then `C-c C-c`)
4. `P P` to push

**Why it's essential:** If you work with Git, Magit will transform your
workflow. It's visual, fast, and incredibly powerful.

---

## 🎯 **Quick Start Checklist**

Once you've read through the above, try this 5-minute workflow:

1. ✅ **Open Doom:** `emacs` in terminal
2. ✅ **Find a file:** `SPC f f` and open any text file
3. ✅ **Edit something:** Press `i`, type text, press `ESC`
4. ✅ **Save:** `SPC f s`
5. ✅ **Open file explorer:** `SPC .`
6. ✅ **Get help:** `SPC h`
7. ✅ **Split window:** `SPC w v`
8. ✅ **Switch buffers:** `SPC b b`
9. ✅ **Search project:** `SPC s p` (if in a project)
10. ✅ **Quit:** `SPC q q`

---

## 📖 **Next Steps: Dive Deeper**

Once you're comfortable with the basics above:

1. **Read the specific cheatsheets:**
   - `emacs.file-explorer.cheatsheet.md` - File management
   - `emacs.code-completion.cheatsheet.md` - Coding features
   - `emacs.magit.cheatsheet.md` - Git integration
   - `emacs.markdown.cheatsheet.md` - Markdown editing

2. **Customize gradually:** Start tweaking your `config.el`
3. **Learn your language:** Explore language-specific features
4. **Join the community:** Doom Discord, Reddit, GitHub discussions

---

## 🆘 **When You're Stuck**

**Emergency commands:**

- `C-g` - Cancel current command (like pressing ESC)
- `SPC q q` - Quit Emacs
- `SPC h d h` - Doom help
- `:q` - Quit current buffer (Vim command)

**Remember:** Every expert was once a beginner. Don't try to learn everything at
once. Master these 10 things first, then gradually explore more advanced
features.

**Most important tip:** Use `SPC` and explore the menus. Doom is designed to be
discoverable - let it guide you!

---

## 🎓 **Learning Philosophy**

**Start with workflows, not features:** Instead of memorizing every keybinding,
learn complete workflows for tasks you do daily (editing files, committing code,
searching projects).

**Use the defaults first:** Doom's defaults are excellent. Resist the urge to
customize everything immediately.

**One thing at a time:** Master file navigation before diving into advanced code
features. Build your skills incrementally.

**Practice daily:** Use Doom for real work, even if you're slower at first.
Muscle memory develops with practice.

Welcome to Doom Emacs! 🚀
