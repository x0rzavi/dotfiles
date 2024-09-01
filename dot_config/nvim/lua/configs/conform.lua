local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettierd" },
    html = { "prettierd" },
    js = { "prettierd" },
    python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    c = { "clang-format" },
    sh = { "shfmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
