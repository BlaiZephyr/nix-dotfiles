# Doom Emacs Markdown Cheatsheet

## 📝 **Getting Started**
- Open any `.md` file - Doom automatically enables `markdown-mode`
- You'll get syntax highlighting, proper indentation, and markdown-specific features

## ⌨️ **Key Markdown Commands** (with Evil/Vim bindings)

### **Formatting Text:**
- `SPC m b` - **Bold** text
- `SPC m i` - *Italic* text  
- `SPC m c` - `Inline code`
- `SPC m C` - Code block
- `SPC m s` - ~~Strikethrough~~

### **Headers:**
- `SPC m h` - Insert header (prompts for level 1-6)
- `SPC m H` - Insert header with underline style

### **Lists:**
- `SPC m l` - Insert unordered list item
- `SPC m L` - Insert ordered list item

### **Links & Images:**
- `SPC m l l` - Insert link
- `SPC m l i` - Insert image
- `SPC m l u` - Insert URL

### **Navigation:**
- `]]` - Next header
- `[[` - Previous header
- `SPC m o` - Open outline/table of contents

## 👁️ **Live Preview**
- `SPC m p` - Preview in browser
- `SPC m P` - Export to HTML

## 📊 **Tables**
- `SPC m t` - Table commands
- `SPC m t t` - Insert table
- `TAB` - Navigate between cells
- `S-TAB` - Navigate backward between cells

## 🎯 **Useful Evil Bindings in Markdown**
- `TAB` - Cycle folding of headers
- `S-TAB` - Cycle folding globally
- `RET` - Follow links
- `M-RET` - Insert new list item

## 🧪 **Test Examples**

### Sample Formatting
This is **bold text** and this is *italic text*.

Here's some `inline code` and a code block:

```bash
# Code block example
echo "Hello from markdown!"
```

### Sample List
- [ ] Checkbox item 1
- [x] Completed checkbox
- Regular bullet point

### Sample Table
| Feature | Shortcut | Description |
|---------|----------|-------------|
| Bold    | SPC m b  | Make text bold |
| Italic  | SPC m i  | Make text italic |
| Preview | SPC m p  | Preview in browser |

## 🚀 **Pro Tips**
1. Use `SPC m o` to get an outline view for navigation
2. `TAB` on headers to fold/unfold sections
3. `RET` on links to follow them
4. Use `SPC m p` to preview your markdown in a browser
5. Create checklists with `- [ ]` syntax

## 📚 **Quick Reference**
- All markdown commands start with `SPC m`
- Use `SPC m ?` or `C-h m` to see all available commands
- Navigation between headers: `]]` (next) and `[[` (previous)
- Toggle folding: `TAB` (local) and `S-TAB` (global)
