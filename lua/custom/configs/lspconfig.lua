local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"



lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}

lspconfig.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = util.root_pattern("package.json"),
    filestypes = {"typescript ,svelte"},
})

lspconfig.svelteserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    --root_dir = util.root_pattern("package.json"),
    filestypes = {"svelte"},
})

--[[
    lspconfig.rust_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filestypes = {"rust"},
        root_dir = util.root_pattern("Cargo.toml"),
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    allFeatures = true,
                },
            },
        },
    })
]]

