local tokyonight = require("tokyonight")

tokyonight.setup({
	-- style = "day",
	-- style = 'moon',
	style = 'night',
	-- style = 'storm',
	on_highlights = function(hl, c)

		-- Editor
		hl.CursorLineNr = { fg = c.magenta }
		hl.Folded = { fg = c.info, bg = c.terminal.black }

		-- Winbar/ Luabar
		hl.LualineWinbarNeutral = { fg = c.dark3, bg = "none"}
		
		-- Git
    	hl.GitSignsChange = { fg = c.purple }
		
		-- Floats
		hl.FloatBorder = { fg = c.magenta, bg = c.terminal.black }
		hl.FloatTitle = { fg = c.cyan, bg = c.terminal.black, bold = true }

		-- Completion and LSP
		hl.BlinkCmpMenuBorder = { link = "FloatBorder" 	}
		
		-- Telescope
		hl.TelescopeBorder = { link = "FloatBorder" }
		hl.TelescopeTitle = { link = "FloatTitle" }
		hl.TelescopePromptBorder = { link = "FloatBorder" }
		hl.TelescopePromptTitle = { fg = c.orange, bg = c.terminal.black, bold = true }

		-- Snacks
		hl.SnacksInputBorder = { link = "FloatBorder" }
		hl.SnacksInputTitle = { link = "TelescopePromptTitle" }
		hl.SnacksPickerInputBorder = { link = "FloatBorder" }
		hl.SnacksPickerInputTitle = { link = "TelescopePromptTitle" }
	end,
})

tokyonight.load()
