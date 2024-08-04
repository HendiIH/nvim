local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "cohama/lexima.vim",
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
 "ahmedkhalf/project.nvim",
 opts = {
 detection_methods = { "lsp", "pattern" },
 patterns = { ".git", ".project" },
 datapath = vim.fn.stdpath("cache"),
 },
 config = function(_, opts)
require("project_nvim").setup(opts) require("telescope").load_extension("projects")
 end,
 "MysticalDevil/inlay-hints.nvim",
 event = "LspAttach",
 dependencies = { "neovim/nvim-lspconfig" },
 config = function()
   require("inlay-hints").setup()
 end,
 'ggandor/leap.nvim',
 'williamboman/mason.nvim',
 'williamboman/mason-lspconfig.nvim',
 'neovim/nvim-lspconfig',  
 'nvim-java/nvim-java',
 'hrsh7th/cmp-nvim-lsp',
 'hrsh7th/cmp-buffer',
 'hrsh7th/cmp-path',
 'hrsh7th/cmp-cmdline',
 'hrsh7th/nvim-cmp',
 'L3MON4D3/LuaSnip',
 'saadparwaiz1/cmp_luasnip',
 'rafamadriz/friendly-snippets',
 'nvim-telescope/telescope.nvim',
 'scottmckendry/cyberdream.nvim',
 'mbbill/undotree',
 priority = 1000,
})

require('java').setup()
require('lspconfig').jdtls.setup({})

require("mason").setup()
require("mason-lspconfig").setup()
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
require("mason-lspconfig").setup_handlers({
  function (server_name)
    require('lspconfig')[server_name].setup {}
  end,
})

require('leap').create_default_mappings()
require("luasnip.loaders.from_vscode").lazy_load()
require('project_nvim').setup()
require("inlay-hints").setup({
commands = { enable = true }, -- Enable InlayHints commands, include `InlayHintsToggle`, `InlayHintsEnable` and `InlayHintsDisable`
autocmd = { enable = true } -- Enable the inlay hints on `LspAttach` event
})
