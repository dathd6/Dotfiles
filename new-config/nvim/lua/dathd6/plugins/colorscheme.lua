return {
    "sainnhe/gruvbox-material",
     config = function()
        vim.cmd("colorscheme gruvbox-material")
        vim.cmd([[
            highlight NvimTreeNormal guibg=#282828
            highlight NvimTreeNormalNC guibg=#282828
            highlight NvimTreeEndOfBuffer guibg=#282828 guifg=#282828
        ]])
    end
}
