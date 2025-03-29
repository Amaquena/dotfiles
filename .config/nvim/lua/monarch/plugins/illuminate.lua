return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    delay = 200,
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { "lsp" },
    },
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
  end,
  keys = {
    -- stylua: ignore start
    {"]r", function() require('illuminate').goto_next_reference(false)  end, desc = "Next Reference"},
    {"[r", function() require('illuminate').goto_prev_reference(false) end, desc = "Prev Reference"},
    -- stylua: ignore end
  },
}
