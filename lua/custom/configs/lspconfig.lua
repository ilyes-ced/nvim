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

lspconfig.svelte.setup({
  on_attach = on_attach,
  capabilities = capabilities,

  default_config = {
    cmd = { 'svelteserver', '--stdio' },
    filetypes = { 'svelte' },
    root_dir = util.root_pattern('package.json', '.git'),
  },
  docs = {
    description = [[
      https://github.com/sveltejs/language-tools/tree/master/packages/language-server

      Note: assuming that [tsserver](#tsserver) is setup, full JavaScript/TypeScript support (find references, rename, etc of symbols in Svelte files when working in JS/TS files) requires per-project installation and configuration of [typescript-svelte-plugin](https://github.com/sveltejs/language-tools/tree/master/packages/typescript-plugin#usage).

      `svelte-language-server` can be installed via `npm`:
      ```sh
      npm install -g svelte-language-server
      ```
    ]],
    default_config = {
      root_dir = [[root_pattern("package.json", ".git")]],
    },
  },
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

