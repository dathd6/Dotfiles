return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        nvimtree.setup({
            view = {
                adaptive_size = true,
                relativenumber = true,
                side = "left",
            },
            -- change folder arrow icons
            renderer = {
                group_empty = true,
                indent_markers = {
                    enable = true,
                },
                icons = { show = { folder_arrow = false } },
            },
            hijack_directories = {
                enable = true, -- Automatically hijack directories
                auto_open = true, -- Open nvim-tree automatically in directories
            },
            hijack_netrw = true,
            actions = {
                open_file = {
                    quit_on_open = false,
                    resize_window = true,
                    window_picker = {
                        enable = false, -- Disable the window picker
                    },
                },
            },
            filters = {
                custom = { ".DS_Store" },
            },
            git = {
                ignore = false,
            }
        })
        -- set keymaps
        local keymap = vim.keymap -- for conciseness
        keymap.set("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    end
}
