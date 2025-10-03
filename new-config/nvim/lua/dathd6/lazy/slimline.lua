return {
    -- Calls `require('slimline').setup({})`
    "sschleemilch/slimline.nvim",
    opts = {
        style = "fg",
        spaces = {
            components = '',
            left = '',
            right = ''
        },
        -- Disable winbar (the top line)
        use_winbar = false,         -- some versions use this option
        winbar = nil,               -- if the plugin supports winbar component
        inactive_winbar = nil,
    },
}
