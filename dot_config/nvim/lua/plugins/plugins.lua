return {
  -- {
  --   "savq/melange-nvim",
  -- },

  -- {
  --   "nyoom-engineering/oxocarbon.nvim",
  -- },
  --
  -- {
  --   "navarasu/onedark.nvim",
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("onedark").setup({
  --       style = "deep",
  --     })
  --     -- Enable theme
  --     require("onedark").load()
  --   end,
  -- },

  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
    build = false,
  },

  -- disable copilot auto completions
  {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },

  -- disable copilot auto completions
  {
    "fang2hou/blink-copilot",
    opts = {
      max_completions = 0, -- Global default for max completions
      max_attempts = 2, -- Global default for max attempts
    },
  },

  {
    "LazyVim/LazyVim",
    -- opts = {
    --   colorscheme = "oxocarbon",
    -- },
  },

  {
    "Civitasv/cmake-tools.nvim",
    keys = {
      { "<leader>ckc", "<cmd>CMakeClean<cr>", desc = "(C)Ma(k)e (C)lean", mode = { "n" } },
      { "<leader>ckg", "<cmd>CMakeGenerate<cr>", desc = "(C)Ma(k)e (G)enerate", mode = { "n" } },
      { "<leader>ckb", "<cmd>CMakeBuild<cr>", desc = "(C)Ma(k)e (B)uild", mode = { "n" } },
      { "<leader>ckr", "<cmd>CMakeRun<cr>", desc = "(C)Ma(k)e (R)un", mode = { "n" } },
      { "<leader>ckf", "<cmd>CMakeRunCurrentFile<cr>", desc = "(C)Ma(k)e Run Current (F)ile", mode = { "n" } },
      { "<leader>ckt", "<cmd>CMakeRunTest<cr>", desc = "(C)Ma(k)e (T)est", mode = { "n" } },
      { "<leader>ckx", "<cmd>CMakeSelectBuildTarget<cr>", mode = { "n" } },
      { "<leader>ckz", "<cmd>CMakeSelectLaunchTarget<cr>", mode = { "n" } },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      PATH = "append",
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local mason_servers = { "emmet_language_server" } -- install with Mason

      local my_servers = { -- all configured servers
        clangd = {},
        lua_ls = {},
        pylsp = {},
        ruff = {},
        html = {},
        cssls = {},
        ts_ls = {},
        emmet_language_server = {},
        tinymist = {},
      }

      -- preserves default ["*"] entry and lazyvim modifications
      opts.servers = vim.tbl_deep_extend("force", opts.servers, my_servers)

      for server, server_opts in pairs(opts.servers) do
        if server ~= "*" then -- Don't mess with the special "*" entry
          server_opts.mason = false
        end
      end

      for _, server in ipairs(mason_servers) do
        -- Ensure table exists before setting mason=true
        opts.servers[server] = opts.servers[server] or {}
        opts.servers[server].mason = true
      end
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        html = { "prettierd" },
        css = { "prettierd" },
        js = { "prettierd" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        sh = { "shfmt" },
        typst = { "typstyle" },
      },
    },
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        -- c = { "clangtidy" },
        -- cpp = { "clangtidy" },
        python = { "ruff" },
      },
    },
  },

  {
    "nvim-focus/focus.nvim",
    opts = true,
  },

  {
    "CRAG666/code_runner.nvim",
    ft = { "c", "cpp", "python", "sh", "rs" },
    opts = {
      filetype = {
        c = {
          "cd $dir &&",
          "clang -Wall -Wextra -std=c23 -pedantic -Wshadow -Wformat=2 -Wcast-align -Wconversion -Wsign-conversion -Wnull-dereference -Wno-unused-variable -lm $fileName", -- compile
          "-o $fileNameWithoutExt &&",
          "$dir/$fileNameWithoutExt ;", -- run
          "rm -f $dir/$fileNameWithoutExt", -- cleanup
        },
        cpp = {
          "cd $dir &&",
          "clang++ -Wall -Wextra -std=c++23 -pedantic -Wshadow -Wformat=2 -Wcast-align -Wconversion -Wsign-conversion -Wnull-dereference -Wno-unused-variable -Weffc++ $fileName", -- compile
          "-o $fileNameWithoutExt &&",
          "$dir/$fileNameWithoutExt ;", -- run
          "rm -f $dir/$fileNameWithoutExt", -- cleanup
        },
        python = "python -u",
        sh = "bash",
        rust = "cargo run",
      },
    },
  },

  {
    "kawre/leetcode.nvim",
    -- build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
    dependencies = {
      -- include a picker of your choice, see picker section for more details
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lang = "python3",
    },
  },

  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      user_default_options = {
        css = true,
      },
    },
  },

  {
    "karb94/neoscroll.nvim",
    opts = true,
  },

  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    config = function()
      require("mcphub").setup()
    end,
  },

  {
    "chomosuke/typst-preview.nvim",
    -- lazy = false,
    ft = "typst",
    version = "1.*",
    opts = {
      dependencies_bin = {
        ["tinymist"] = "tinymist",
        ["websocat"] = "websocat",
      },
    }, -- lazy.nvim will implicitly calls `setup {}`
  },
}
