require("dathd6.set")
require("dathd6.remap")
require("dathd6.lazy_init")

-- DO.not
-- DO NOT INCLUDE THIS

-- If i want to keep doing lsp debugging
-- function restart_htmx_lsp()
--     require("lsp-debug-tools").restart({ expected = {}, name = "htmx-lsp", cmd = { "htmx-lsp", "--level", "DEBUG" }, root_dir = vim.loop.cwd(), });
-- end

-- DO NOT INCLUDE THIS
-- DO.not

local augroup = vim.api.nvim_create_augroup
local Dathd6Group = augroup('Dathd6', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = Dathd6Group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd('BufEnter', {
    group = Dathd6Group,
    callback = function()
        pcall(vim.cmd.colorscheme, "gruvbox-flat")

        pcall(vim.cmd.highlight, "String guifg=#8DC07C")
        pcall(vim.cmd.highlight, "Character guifg=#83A598")
        pcall(vim.cmd.highlight, "Function guifg=#FB4A34")
        pcall(vim.cmd.highlight, "Comment guifg=#665C54")
        pcall(vim.cmd.highlight, "Boolean guifg=#83A598")
        pcall(vim.cmd.highlight, "Constant guifg=#E54C2B")
        pcall(vim.cmd.highlight, "Identifier guifg=#FBF1C7")
        pcall(vim.cmd.highlight, "CursorLineNr guifg=#458488")

        pcall(vim.cmd.highlight, "Normal guibg=NONE guifg=#FBF1C7")
        pcall(vim.cmd.highlight, "NormalNC guibg=NONE")
        pcall(vim.cmd.highlight, "SignColumn guibg=NONE")
        pcall(vim.cmd.highlight, "EndOfBuffer guibg=NONE")
        pcall(vim.cmd.highlight, "StatusLine guibg=#3A3A3A")
        pcall(vim.cmd.highlight, "StatusLineNC guibg=NONE")

        pcall(vim.cmd.highlight, "TabLine guibg=NONE")
        pcall(vim.cmd.highlight, "TabLineSel guibg=NONE")
        pcall(vim.cmd.highlight, "TabLineFill guibg=NONE")
    end
})


autocmd('LspAttach', {
    group = Dathd6Group,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
