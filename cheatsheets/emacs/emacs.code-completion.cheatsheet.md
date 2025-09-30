# Doom Emacs Code Completion & Lookup Cheatsheet

## 🚀 **What You Have (Like nvim-cmp + blink.cmp)**

If your Doom config includes:
- **Company Mode** - Auto-completion framework
- **LSP Mode** - Language Server Protocol support
- **Tree-sitter** - Advanced syntax parsing
- **Lookup tools** - Documentation and definition lookup

## ⌨️ **Code Completion (Company)**

### **Auto-completion Controls:**
- `TAB` or `C-SPC` - **Accept completion**
- `C-n` / `j` - **Next completion** (evil mode)
- `C-p` / `k` - **Previous completion** (evil mode)
- `C-w` - **Show documentation** for completion
- `C-s` - **Search/filter completions**
- `ESC` or `C-g` - **Cancel completion**

### **Manual Completion:**
- `M-/` - **Complete at point** (manual trigger)
- `C-M-/` - **Expand abbreviation**

## 🔍 **Code Lookup & Navigation**

### **Go to Definition/References:**
- `gd` - **Go to definition** (evil mode)
- `gD` - **Go to declaration**  
- `gr` - **Go to references**
- `SPC c d` - **Find definition**
- `SPC c D` - **Find references**
- `SPC c i` - **Find implementations**

### **Documentation Lookup:**
- `K` - **Lookup documentation** (evil mode)
- `SPC c k` - **Lookup documentation**
- `SPC c K` - **Lookup in docsets**
- `C-h f` - **Describe function**
- `C-h v` - **Describe variable**

### **Symbol Navigation:**
- `SPC c j` - **Jump to symbol in buffer**
- `SPC c J` - **Jump to symbol in project**
- `SPC s i` - **Search for symbol**

## 🛠️ **LSP Features (Language Server)**

### **LSP Actions:**
- `SPC c a` - **Code actions** (refactor, fix, etc.)
- `SPC c r` - **Rename symbol**
- `SPC c f` - **Format buffer/region**
- `SPC c o` - **Organize imports**

### **Error Navigation:**
- `]e` - **Next error**
- `[e` - **Previous error**
- `SPC c x` - **List errors**

### **LSP Info:**
- `SPC c l` - **LSP menu**
- `SPC c h` - **Show hover info**
- `SPC c s` - **Show signature**

## 🎯 **Language-Specific Features**

### **C/C++ (clang-tools)**
- Full completion for functions, variables, types
- Go to definition across files
- Error checking and diagnostics
- Code formatting with clang-format

### **Nix (nil LSP)**
- Nix language completion
- Function documentation
- Syntax checking
- Go to definition for Nix expressions

### **JSON (vscode-json-languageserver)**
- Schema-based completion
- Validation and error checking
- Go to definition in JSON files

## ⚡ **Pro Tips**

### **Fuzzy Search Everything:**
- `SPC f f` - **Find files**
- `SPC /` - **Search in project**
- `SPC s s` - **Search buffer**
- `SPC p p` - **Switch projects**

### **Better Navigation:**
- `C-o` - **Go back** (after jumping to definition)
- `C-i` - **Go forward**
- `SPC j j` - **Jump to character** (like easymotion)

### **Completion Tweaks:**
- Completions appear after 0.2 seconds of typing
- Minimum 1 character to trigger
- Shows documentation in popup
- Works with both Company and LSP

## 🔧 **Troubleshooting**

### **If completion isn't working:**
1. Check if LSP server is running: `SPC c l`
2. Restart LSP: `SPC c l r`
3. Check syntax errors: `SPC c x`

### **Performance:**
- LSP servers auto-start when you open supported files
- Completion is optimized for fast response
- Use `SPC h r r` to reload Doom config after changes

## 🚀 **Quick Start Workflow**

1. **Open a code file** (`.c`, `.nix`, `.json`)
2. **Start typing** - completions appear automatically
3. **Navigate with `j/k`** and **accept with `TAB`**
4. **Use `gd`** to jump to definitions
5. **Use `K`** to see documentation
6. **Use `SPC c a`** for code actions

## 📚 **Language Servers Included**
- **C/C++**: `clang-tools` (clangd)
- **Nix**: `nil`  
- **JSON**: `vscode-json-languageserver`
- More can be added per language as needed!
