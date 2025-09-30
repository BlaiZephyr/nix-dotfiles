# Doom Emacs Magit Cheatsheet

## 🚀 **What is Magit?**

Magit is an extremely powerful tool for managing your Git project

- Visual, interactive Git workflows
- Stage hunks, lines, or entire files with ease
- Commit, push, pull, merge, rebase - all from intuitive menus
- See your repo status at a glance

## 📋 **Requirements**

- Git installed on your system
- Doom Emacs with Magit enabled (included by default)
- Working inside a Git repository

## ⌨️ **Opening Magit**

### **Main Magit Interface:**

- `SPC g g` - **Magit status** (your main command!)
- `SPC g d` - **Magit file dispatch**
- `SPC g f` - **Magit file commands**
- `SPC g l` - **Magit log**
- `SPC g b` - **Magit blame**

## 🎯 **The Magit Status Buffer** (Your Command Center)

### **Navigation:**

- `j/k` or `n/p` - **Move up/down** between sections
- `TAB` - **Expand/collapse** section under cursor
- `M-TAB` - **Expand/collapse** all sections
- `g` - **Refresh** status buffer

### **Section Overview:**

```
Untracked files     - Files not in Git
Unstaged changes    - Modified files not staged
Staged changes      - Files ready to commit
Recent commits      - Your commit history
Stashes            - Your saved work-in-progress
```

## 📝 **Staging & Unstaging**

### **Stage Files:**

- `s` - **Stage** file/hunk under cursor
- `S` - **Stage all** unstaged changes
- `i` - **Ignore** file (add to .gitignore)

### **Unstage Files:**

- `u` - **Unstage** file/hunk under cursor
- `U` - **Unstage all** staged changes

### **Discard Changes:**

- `k` - **Discard** changes in file/hunk under cursor
- `K` - **Discard all** changes in working directory

### **Staging Hunks & Lines:**

- `RET` or `SPC` - **Show diff** of file under cursor
- In diff view:
  - `s` - **Stage hunk** under cursor
  - `u` - **Unstage hunk** under cursor
  - `k` - **Discard hunk** under cursor
  - `+/-` - **Show more/less context** lines

## 💾 **Committing**

### **Create Commits:**

- `c c` - **Commit** (opens commit message buffer)
- `c a` - **Amend** last commit
- `c e` - **Extend** last commit (no message change)
- `c w` - **Reword** last commit message
- `c f` - **Fixup** commit
- `c s` - **Squash** commit

### **In Commit Message Buffer:**

- `C-c C-c` - **Finish commit**
- `C-c C-k` - **Cancel commit**
- `M-p/M-n` - **Previous/next** commit message from history

## 🌿 **Branching & Switching**

### **Branch Operations:**

- `b b` - **Switch branch** (checkout)
- `b c` - **Create new branch**
- `b n` - **Create branch** from current HEAD
- `b s` - **Create branch** and switch to it
- `b r` - **Rename branch**
- `b k` - **Delete branch**

### **Remote Branches:**

- `b a` - **Set upstream** for current branch
- `b u` - **Set upstream** and push

## 🔄 **Remote Operations**

### **Fetch & Pull:**

- `f f` - **Fetch** from default remote
- `f a` - **Fetch from all** remotes
- `F F` - **Pull** from upstream
- `F u` - **Pull from upstream** (rebase)

### **Push:**

- `P P` - **Push** to upstream
- `P u` - **Push and set upstream**
- `P f` - **Force push** (use carefully!)
- `P t` - **Push tags**

## 📚 **Viewing History & Logs**

### **Log Views:**

- `l l` - **Show log** for current branch
- `l o` - **Show log** for other branches
- `l h` - **Show log** for HEAD
- `l a` - **Show log** for all branches
- `l f` - **Show log** for file under cursor

### **In Log View:**

- `RET` - **Show commit** details
- `d d` - **Show diff** for commit
- `c c` - **Create new commit**
- `r r` - **Revert commit**

## 🔍 **Diffs & Comparisons**

### **Diff Commands:**

- `d d` - **Diff working directory** vs staged
- `d s` - **Diff staged** vs HEAD
- `d u` - **Diff unstaged** changes
- `d r` - **Diff range** between commits

### **In Diff Views:**

- `j/k` - **Navigate** between hunks
- `n/p` - **Next/previous** file
- `TAB` - **Toggle** visibility of diff section
- `+/-` - **Increase/decrease** context lines

## 🔧 **Rebasing & Merging**

### **Merge:**

- `m m` - **Merge** branch
- `m a` - **Abort merge**
- `m c` - **Continue merge**

### **Rebase:**

- `r i` - **Interactive rebase**
- `r r` - **Rebase** branch
- `r a` - **Abort rebase**
- `r c` - **Continue rebase**

### **During Interactive Rebase:**

- `j/k` - **Move** between commits
- `p` - **Pick** commit (default)
- `r` - **Reword** commit message
- `e` - **Edit** commit
- `s` - **Squash** commit
- `f` - **Fixup** commit
- `d` - **Drop** commit

## 📦 **Stashing**

### **Stash Operations:**

- `z z` - **Stash** current changes
- `z i` - **Stash** with message
- `z a` - **Apply stash**
- `z p` - **Pop stash** (apply and delete)
- `z k` - **Drop stash**
- `z l` - **List stashes**

## 🏷️ **Tags**

### **Tag Operations:**

- `t t` - **Create tag**
- `t a` - **Create annotated tag**
- `t k` - **Delete tag**
- `t p` - **Push tag**

## ⚡ **Pro Tips & Workflows**

### **Daily Git Workflow:**

1. `SPC g g` - **Open Magit status**
2. Review changes, stage with `s`
3. `c c` - **Commit changes**
4. `P P` - **Push to remote**

### **Power User Tricks:**

- Use `M-x magit-find-file` to quickly open files from Git history
- `SPC g f s` - **Stage current file** without opening Magit
- `SPC g f u` - **Unstage current file**
- `SPC g f d` - **Show file diff**

### **Staging Granularity:**

- Stage entire files with `s` in status buffer
- Stage individual hunks by entering diff view (`RET`) then `s`
- Stage individual lines by selecting region in diff then `s`

### **Commit Best Practices:**

- Use `c c` for normal commits
- Use `c a` to fix up your last commit
- Use `c f` to create fixup commits for interactive rebase later

## 🔧 **Troubleshooting**

### **Common Issues:**

- **Magit won't open?** Make sure you're in a Git repository
- **Performance slow?** Try `M-x magit-refresh` or restart Emacs
- **Merge conflicts?** Magit highlights conflicts - resolve them and use `m c`

### **Getting Help:**

- `?` - **Show help** in any Magit buffer
- `C-h m` - **Show mode help**
- `SPC h d m magit` - **Full Magit documentation**

## 🚀 **Quick Start Workflow**

1. **Navigate to your Git repo** in Doom Emacs
2. **Press `SPC g g`** - Opens Magit status
3. **Stage files** with `s`, review diffs with `RET`
4. **Commit** with `c c`, write message, finish with `C-c C-c`
5. **Push** with `P P`

## 📚 **Essential Keybind Summary**

| Action  | Key       | Description        |
| ------- | --------- | ------------------ |
| Status  | `SPC g g` | Open Magit status  |
| Stage   | `s`       | Stage file/hunk    |
| Unstage | `u`       | Unstage file/hunk  |
| Commit  | `c c`     | Create commit      |
| Push    | `P P`     | Push to upstream   |
| Pull    | `F F`     | Pull from upstream |
| Branch  | `b b`     | Switch branch      |
| Log     | `l l`     | Show log           |
| Diff    | `d d`     | Show diff          |
| Stash   | `z z`     | Stash changes      |
| Help    | `?`       | Show context help  |

## 🎉 **Why Magit is Amazing**

- **Visual**: See your entire repo state at a glance
- **Interactive**: Stage hunks, lines, or files with simple keystrokes
- **Fast**: Navigate Git operations faster than any CLI
- **Powerful**: Access every Git feature through intuitive menus
- **Integrated**: Works seamlessly with Doom Emacs and Evil mode

**Pro Tip**: Once you learn Magit, you'll never want to use Git from the command
line again! 🚀
