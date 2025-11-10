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
    opts = {},
    config = function()
        require('tokyonight').load()
    end
}
