local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

        -- override plugin configs
        {
                "nvim-treesitter/nvim-treesitter",
                opts = overrides.treesitter,
        },
        {
                "neovim/nvim-lspconfig",
                dependencies = {
                        "jose-elias-alvarez/null-ls.nvim",
                        config = function()
                                require "custom.configs.null-ls"
                        end,
                },
                config = function()
                        require("plugins.configs.lspconfig")
                        require("custom.configs.lspconfig")
                end,
        },
        {
                "CRAG666/code_runner.nvim",
                -- ft = { "c", "py", "sh" },
                cmd = { "RunFile", "RunClose" },
                config = function()
                        require("custom.configs.code_runner")
                end,
        },
}

return plugins
