return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
    -- Harpoon config
    local harpoon = require("harpoon")
    vim.keymap.set("n", "<leader>mm", function()
	    harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
vim.keymap.set("n", "<leader>ma", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>mf", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>md", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>mj", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>mk", function()
	harpoon:list():select(4)
end)

    end,
}