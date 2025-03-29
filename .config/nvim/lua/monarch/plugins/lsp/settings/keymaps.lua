local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
  return vim.api.nvim_create_augroup("monarch_" .. name, { clear = true })
end

-- LSP keymaps
autocmd("LspAttach", {
  group = augroup "LSP_Attach",
  callback = function(ev)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = "LSP: " .. desc })
    end

    -- map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")

    -- map("n", "grr", vim.lsp.buf.references, opts)
    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

    map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

    map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

    map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

    map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

    -- map({ "i", "n" }, "<C-k>", vim.lsp.buf.signature_help, opts)
    map("<leader>cd", vim.diagnostic.open_float, "open_float")
    -- map("n", "]d", vim.diagnostic.goto_next, opts)
    -- map("n", "[d", vim.diagnostic.goto_prev, opts)
  end,
})
