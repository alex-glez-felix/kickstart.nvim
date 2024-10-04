return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local function toggle_telescope(harpoon_files)
      local conf = require 'telescope.config'
      local finder = function()
        local paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(paths, item.value)
        end

        return require('telescope.finders').new_table {
          results = paths,
        }
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = finder(),
          previewer = conf.values.file_previewer {},
          sorter = conf.values.generic_sorter {},
          attach_mappings = function(prompt_bufnr, map)
            map('i', '<C-d>', function()
              local state = require 'telescope.actions.state'
              local selected_entry = state.get_selected_entry()
              local current_picker = state.get_current_picker(prompt_bufnr)

              table.remove(harpoon_files.items, selected_entry.index)
              current_picker:refresh(finder())
            end)
            return true
          end,
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
    end, { desc = '[p]rev' })
    vim.keymap.set('n', '<leader>mn', function()
      harpoon:list():next()
    end, { desc = '[n]next' })
    vim.keymap.set('n', '<leader>md', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = '[d] delete' })
  end,
}
