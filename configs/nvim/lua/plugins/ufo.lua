return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = "BufReadPost",
  opts = {
    provider_selector = function(bufnr, filetype, buftype)
      return { "treesitter", "indent" }
    end,
  },
  init = function()
    require("custom.ufo").setup()
  end,
  config = function(_, opts)
    require("custom.ufo").config(opts)
  end,
}
