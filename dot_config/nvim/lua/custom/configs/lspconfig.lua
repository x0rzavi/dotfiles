local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "clangd", "pyright" }

for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
                on_attach = on_attach,
                capabilities = capabilities,
        }
end

capabilities.offsetEncoding = 'utf-8'
lspconfig.clangd.setup {
        capabilities = capabilities,
}
