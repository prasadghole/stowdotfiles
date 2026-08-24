-- project.nvim detects the project root (like VS Code's workspace root)
-- and keeps cwd pointed at it, so Telescope/neo-tree search the whole
-- workspace instead of wherever the current buffer happens to live.
-- https://github.com/ahmedkhalf/project.nvim

return {
  'ahmedkhalf/project.nvim',
  opts = {
    detection_methods = { 'pattern' },
    patterns = { '.git', 'lua', 'package.json', 'Makefile' },
  },
  config = function(_, opts)
    require('project_nvim').setup(opts)
    pcall(require('telescope').load_extension, 'projects')
  end,
}
