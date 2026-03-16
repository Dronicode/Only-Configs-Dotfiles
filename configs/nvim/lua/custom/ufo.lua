local M = {}

function M.setup()
	vim.o.foldcolumn = "1" -- '0' is not bad
	vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
	vim.o.foldlevelstart = 99
	vim.o.foldenable = true
end

local handler = function(virtText, lnum, endLnum, width, truncate)
	local newVirtText = {}
	local suffix = (" 󰁂 %d "):format(endLnum - lnum)
	local sufWidth = vim.fn.strdisplaywidth(suffix)
	local targetWidth = width - sufWidth
	local curWidth = 0
	for _, chunk in ipairs(virtText) do
		local chunkText = chunk[1]
		local chunkWidth = vim.fn.strdisplaywidth(chunkText)
		if targetWidth > curWidth + chunkWidth then
			table.insert(newVirtText, chunk)
		else
			chunkText = truncate(chunkText, targetWidth - curWidth)
			local hlGroup = chunk[2]
			table.insert(newVirtText, { chunkText, hlGroup })
			chunkWidth = vim.fn.strdisplaywidth(chunkText)
			-- str width returned from truncate() may less than 2nd argument, need padding
			if curWidth + chunkWidth < targetWidth then
				suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
			end
			break
		end
		curWidth = curWidth + chunkWidth
	end
	table.insert(newVirtText, { suffix, "DiagnosticVendor" })
	return newVirtText
end

function M.config(opts)
	local ufo = require("ufo")
	opts.fold_virt_text_handler = handler
	ufo.setup(opts)
	vim.keymap.set("n", "zO", function()
		ufo.openAllFolds()
	end, { desc = "Open all folds" })
	vim.keymap.set("n", "zC", function() ufo.closeAllFolds() end, { desc = "Close all folds" })
	vim.keymap.set("n", "zo", "zo", { desc = "Open fold" })
	vim.keymap.set("n", "zc", "zc", { desc = "Close fold" })
	vim.keymap.set("n", "zko", function() ufo.openFoldsExceptKinds() end, { desc = "Open folds except kinds" })
	vim.keymap.set("n", "zkc", function() ufo.closeFoldsWithKind() end, { desc = "Close folds with kind" })
end

return M
