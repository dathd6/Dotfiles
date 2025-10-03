return {
    "GCBallesteros/jupytext.nvim",
    config = function()
        require("jupytext").setup({
            style = "markdown", -- or "py"
            output_extension = "md", -- or "py"
            force_ft = "markdown",  -- or "python"
        })
    end,
    -- Depending on your nvim distro or config you may need to make the loading not lazy
    -- lazy=false,
}
