return {
    "benlubas/molten-nvim",
    build = ":UpdateRemotePlugins", -- required to register python plugins
    config = function()
        vim.keymap.set("n", "<leader>rc", ":MoltenReevaluateAll<CR>", { desc = "re-eval cell", silent = true })
        vim.keymap.set("n", "<leader>k", ":MoltenPrev<CR>")
        vim.keymap.set("n", "<leader>j", ":MoltenNext<CR>")
    end
}
