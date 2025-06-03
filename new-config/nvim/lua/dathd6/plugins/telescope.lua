return {
    "nvim-telescope/telescope.nvim",
    dependencies  = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")
        local mark = require("harpoon.mark")

        telescope.setup({
            defaults = {
                path_display  = { "smart" },
                mappings  = {
                    i = {
                        ["<C-p>"] = actions.move_selection_previous,
                        ["<C-n>"] = actions.move_selection_next,
                        ["<C-i>"] = function(prompt_bufnr)
                            local current_picker = action_state.get_current_picker(prompt_bufnr)
                            if not current_picker then
                                print 'No active Telescope picker'
                                return
                            end

                            for entry in current_picker.manager:iter() do
                                mark.add_file(entry.path)
                            end

                            actions.close(prompt_bufnr)
                        end,
                    }
                },
            },
        })
        telescope.load_extension("fzf")

        -- set keymaps
        local keymap = vim.keymap
        keymap.set("n", "<leader>pf", "<cmd>Telescope find_files<cr>", { desc = "" })
        -- keymap.set("n", "<C-p>", "<cmd>Telescope git_files<cr>", { desc = "" })
        keymap.set("n", "<leader>ps", "<cmd>Telescope live_grep<cr>", { desc = "" } )
    end,
}
