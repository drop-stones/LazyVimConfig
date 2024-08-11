---@class telescope-git-grep.Opts: table<string, any>
---@field cwd? string
---@field regex? string
---@field skip_binary_files? boolean
---@field use_git_root? boolean

---@type telescope-git-grep.Opts
local default_opts = {
  cwd = "%:h:p",
  regex = "extended",
  skip_binary_files = true,
  use_git_root = true,
}

---@param opts lazyvim.util.pick.Opts?
---@return boolean
local in_worktree = function(opts)
  local utils = require("telescope.utils")
  opts = opts or {}
  local cwd = vim.F.if_nil(opts.cwd, vim.uv.cwd())
  return utils.get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" }, cwd)[1]
end

---@param opts lazyvim.util.pick.Opts?
---@return telescope-git-grep.Opts
local setup_gitgrep_opts = function(opts)
  opts = opts or {}
  local user_opts = {
    cwd = opts.cwd,
    use_git_root = opts.root,
  }
  return vim.tbl_extend("force", default_opts, user_opts)
end

---@param opts lazyvim.util.pick.Opts?
---@return function
local live_grep = function(opts)
  opts = opts or {}
  if in_worktree(opts) then
    return function()
      require("git_grep").live_grep(setup_gitgrep_opts(opts))
    end
  else
    return require("lazyvim.util").pick("live_grep", opts)
  end
end

---@param opts lazyvim.util.pick.Opts?
---@return function
local grep_string = function(opts)
  opts = opts or {}
  if in_worktree(opts) then
    return function()
      require("git_grep").grep(setup_gitgrep_opts(opts))
    end
  else
    return require("lazyvim.util").pick("grep_string", opts)
  end
end

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "davvid/telescope-git-grep.nvim",
        config = function()
          require("lazyvim.util").on_load("telescope.nvim", function()
            require("telescope").load_extension("git_grep")
          end)
        end,
      },
    },
    opts = {
      extensions = {
        git_grep = default_opts,
      },
    },
    keys = function(_, keys)
      local additional_keys = {
        { "<leader>/", live_grep(), desc = "Grep (Root Dir)" },
        { "<leader>sg", live_grep(), desc = "Grep (Root Dir)" },
        { "<leader>sG", live_grep({ root = false }), desc = "Grep (cwd)" },
        { "<leader>sw", grep_string({ word_match = "-w" }), desc = "Word (Root Dir)" },
        { "<leader>sW", grep_string({ root = false, word_match = "-w" }), desc = "Word (cwd)" },
        { "<leader>sw", grep_string(), mode = "v", desc = "Selection (Root Dir)" },
        { "<leader>sW", grep_string({ root = false }), mode = "v", desc = "Selection (cwd)" },
      }

      -- overwrite keys
      local new_keys = {}
      for _, v in ipairs(keys) do
        local overwrite = false
        for _, additional_key in ipairs(additional_keys) do
          if v[1] == additional_key[1] then
            overwrite = true
          end
        end

        if overwrite == false then
          table.insert(new_keys, v)
        end
      end

      keys = vim.tbl_extend("force", new_keys, additional_keys)
      return keys
    end,
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, _)
      local dashboard = require("alpha.themes.dashboard")
      for idx, button in ipairs(dashboard.section.buttons.val) do
        if string.find(button.val, "Find text") then
          local button = dashboard.button(button.opts.shortcut, button.val, live_grep())
          button.opts.hl = "AlphaButtons"
          button.opts.hl_shortcut = "AlphaShortcut"

          dashboard.section.buttons.val[idx] = button
        end
      end
    end,
  },
}
