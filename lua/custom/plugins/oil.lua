return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
  config = function()
    local oil = require 'oil'
    ---@type oil.SetupOpts
    oil.setup {
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ['q'] = 'actions.close',
      },
    }

    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    vim.keymap.set('n', '<space>-', oil.toggle_float, { desc = 'Open floating oil window' })
  end,
}
