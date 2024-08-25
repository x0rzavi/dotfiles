return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    enabled = false,
    opts = {
      ensure_installed = {
        "html-lsp",
        "css-lsp",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },

  {
    "CRAG666/code_runner.nvim",
    ft = { "c", "python", "sh" },
    opts = {
      filetype = {
        c = {
          "cd $dir &&",
          "clang -Wall -Wextra -std=c2x -pedantic -lm $fileName",
          "-o $fileNameWithoutExt &&",
          "$dir/$fileNameWithoutExt &&",
          "rm $dir/$fileNameWithoutExt",
        },
        python = "python -u",
        sh = "bash",
      },
    },
  },
}
