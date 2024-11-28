{
  programs.nvf.settings.vim.statusline.lualine = {
    enable = true;
    theme = "gruvbox";

    extraActiveSection.a = [
      ''
        {
        "filetype",
        colored = false,
        icon_only = true,
        icon = { align = 'left' }
        }
      ''
      ''
        {
        "filename",
        symbols = {modified = ' ', readonly = ' '},
        separator = {right = ''}
        }
      ''
      ''
        {
        "",
        draw_empty = true,
        separator = { left = '', right = '' }
        }
      ''
    ];

    extraActiveSection.z = [
      ''
        {
        "",
        draw_empty = true,
        separator = { left = '', right = '' }
        }
      ''
      ''
        {
        'searchcount',
        maxcount = 999,
        timeout = 120,
        separator = {left = ''}
        }
      ''
      ''
        {
        "branch",
        icon = ' •',
        separator = {left = ''}
        }
      ''

      ''{"mode"} ''
    ];
  };
}
