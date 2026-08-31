-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    -- Uncomment and set this if you want obsidian.nvim to only load for vault directories:
    -- event = {
    --   'BufReadPre ' .. vim.fn.expand '~' .. '/path/to/vault/**.md',
    --   'BufNewFile ' .. vim.fn.expand '~' .. '/path/to/vault/**.md',
    -- },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = 'D:/Sandbox/obsedionblog',
        },
      },

      -- see https://github.com/epwalsh/obsidian.nvim#-completion for completion setup
      completion = {
        nvim_cmp = false,
        blink = true,
      },
    },
  },
}
