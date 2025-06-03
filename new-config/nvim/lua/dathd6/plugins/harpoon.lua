return {
    'theprimeagen/harpoon',
    config = function ()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        local keymap = vim.keymap

        keymap.set("n", "<leader>a", mark.add_file)
        keymap.set("n", "<C-p>", ui.toggle_quick_menu)
        keymap.set("n", "<C-e>", function () ui.nav_file(1) end)
        keymap.set("n", "<C-s>", function () ui.nav_file(2) end)
        keymap.set("n", "<C-n>", function () ui.nav_file(3) end)
        keymap.set("n", "<C-m>", function () ui.nav_file(4) end)
    end
}
