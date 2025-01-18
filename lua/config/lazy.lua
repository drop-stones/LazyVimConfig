local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins.code_runner" },
    { import = "plugins.color" },
    { import = "plugins.colorscheme" },
    { import = "plugins.completion" },
    { import = "plugins.dap" },
    { import = "plugins.dotfiles" },
    { import = "plugins.editing_support" },
    { import = "plugins.git" },
    { import = "plugins.keybinding" },
    { import = "plugins.lang" },
    { import = "plugins.window" }, -- before lsp.aerial
    { import = "plugins.lsp" },
    { import = "plugins.marks" },
    { import = "plugins.motion" },
    { import = "plugins.note_taking" },
    { import = "plugins.startup" }, -- before project
    { import = "plugins.fuzzy_finder" }, -- after startup
    { import = "plugins.project" },
    { import = "plugins.search" },
    { import = "plugins.statusline" },
    { import = "plugins.syntax" },
    { import = "plugins.terminal" },
    { import = "plugins.test" },
    { import = "plugins.util" },
    { import = "plugins.workflow" },
    { import = "plugins.private" },
    { import = "plugins.post_process" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = true,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
