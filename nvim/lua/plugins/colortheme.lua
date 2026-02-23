return {
    -- 'AlexvZyl/nordic.nvim',
    -- lazy = false,
    -- priority = 1000,
    -- config = function()
    --     require('nordic').load()
    -- end

    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        style = "night",
        transparent = false,
        terminal_colors = true,
        on_highlights = function(hl, c)
            hl.FloatBorder = { fg = c.purple }
            hl.LazyGitBorder = { fg = c.purple }
            hl.TelescopeBorder = { fg = c.purple }
            hl.TelescopePromptBorder = { fg = c.purple }
            hl.NeoTreeFloatBorder = { fg = c.purple }
        end,
    },
    config = function(_, opts)
        require('tokyonight').setup(opts)
        require('tokyonight').load()
    end
}
