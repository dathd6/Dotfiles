return {
    "szw/vim-maximizer",
    config = function()
        vim.keymap.set("n", "<leader>sf", ":MaximizerToggle<CR>", { desc = "Maximize current window" })
    end,
}
