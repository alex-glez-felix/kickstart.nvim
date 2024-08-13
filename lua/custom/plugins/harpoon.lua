return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = require('telescope.finders').new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    -- Harpoon config
    local harpoon = require 'harpoon'
    vim.keymap.set('n', '<leader>mm', function()
      toggle_telescope(harpoon:list())
    end, { desc = '[m]enu' })
    vim.keymap.set('n', '<leader>ma', function()
      harpoon:list():add()
    end, { desc = '[a]dd' })
    vim.keymap.set('n', '<leader>m1', function()
      harpoon:list():select(1)
    end, { desc = 'mark [1]' })
    vim.keymap.set('n', '<leader>m2', function()
      harpoon:list():select(2)
    end, { desc = 'mark [2]' })
    vim.keymap.set('n', '<leader>m3', function()
      harpoon:list():select(3)
    end, { desc = 'mark [3]' })
    vim.keymap.set('n', '<leader>m4', function()
      harpoon:list():select(4)
    end, { desc = 'mark [4]' })
    vim.keymap.set('n', '<leader>mp', function()
      harpoon:list():prev()
    end, { desc = '[A]dd' })
    vim.keymap.set('n', '<leader>mn', function()
      harpoon:list():next()
    end, { desc = '[n]next' })
  end,
}
