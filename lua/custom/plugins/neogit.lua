return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed, not both.
    'nvim-telescope/telescope.nvim', -- optional
    'ibhagwan/fzf-lua', -- optional
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup {}

    vim.keymap.set('n', '<leader>gn', function()
      neogit.open()
    end, { desc = '[g]it [n]eo' })
    vim.keymap.set('n', '<leader>gc', function()
      neogit.open { 'commit' }
    end, { desc = '[g]it [c]commit' })
    vim.keymap.set('n', '<leader>gP', function()
      neogit.open { 'push' }
    end, { desc = '[g]it [P]ush' })
    vim.keymap.set('n', '<leader>gp', function()
      neogit.open { 'pull' }
    end, { desc = '[g]it [p]ull' })
    vim.keymap.set('n', '<leader>gs', function()
      neogit.open { 'stash' }
    end, { desc = '[g]it [s]stash' })
  end,
}
