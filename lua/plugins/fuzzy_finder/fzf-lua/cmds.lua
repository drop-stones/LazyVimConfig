local Cmds = {}

local Opts = require("plugins.fuzzy_finder.fzf-lua.opts")

---@alias FzfCmdType "files" | "rg" | "git_grep"

--- Check whether the current working directory is in a git repository
---@param opts lazyvim.util.pick.Opts?
---@return boolean
local in_worktree = function(opts)
  opts = opts or {}
  local cwd = vim.F.if_nil(opts.cwd, vim.uv.cwd())
  return require("util.command").get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" }, cwd)[1]
end

---@param opts lazyvim.util.pick.Opts?
---@return function
function Cmds.live_grep(opts)
  return function()
    if in_worktree(opts) then
      require("fzf-lua").live_grep(Opts.setup_live_gitgrep_opts(opts))
    else
      require("fzf-lua").live_grep(Opts.setup_live_rg_opts(opts))
    end
  end
end

---@param opts lazyvim.util.pick.Opts?
---@return function
function Cmds.grep_cword(opts)
  return function()
    if in_worktree(opts) then
      local search_string = vim.fn.expand("<cword>")
      require("fzf-lua").grep(Opts.setup_search_gitgrep_opts(opts, search_string))
    else
      require("fzf-lua").grep_cword(Opts.setup_search_rg_opts(opts, search_string))
    end
  end
end

---@param opts lazyvim.util.pick.Opts?
---@return function
function Cmds.grep_visual(opts)
  return function()
    if in_worktree(opts) then
      local search_string, _ = require("fzf-lua.utils").get_visual_selection()
      require("fzf-lua").grep(Opts.setup_search_gitgrep_opts(opts, search_string))
    else
      require("fzf-lua").grep_visual(Opts.setup_search_rg_opts(opts, search_string))
    end
  end
end

return Cmds
