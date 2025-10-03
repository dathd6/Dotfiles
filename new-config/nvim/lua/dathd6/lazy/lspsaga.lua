return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
            symbol_in_winbar = {
                enable = false,  -- disables winbar symbols/breadcrumbs
                separator = '  ',
                hide_keyword = true,
                show_file = true,
                folder_level = 1,
                respect_root = false,
            }
        })

        local keymap = vim.keymap

        keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<cr>")
        keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<cr>")
        keymap.set("n", "gt", "<cmd><Lspsaga peek_type_definition<cr>")
        keymap.set("n", "gi", "<cmd>Lspsaga finder imp<cr>")
        keymap.set("n", "gr", "<cmd>Lspsaga finder<cr>")
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    },
}

