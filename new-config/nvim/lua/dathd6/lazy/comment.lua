-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
return {
    'numToStr/Comment.nvim',
    config = function()
        vim.keymap.set("n", "<leader>/", function()
            require("Comment.api").toggle.linewise.current()
        end)

        vim.keymap.set("x", "<leader>/", function()
            local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
            vim.api.nvim_feedkeys(esc, "nx", false)
            require("Comment.api").toggle.linewise(vim.fn.visualmode())
        end)
    end
}

