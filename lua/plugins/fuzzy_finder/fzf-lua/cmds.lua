local M = {}

--- Check whether the current working directory is in a git repository
---@param opts lazyvim.util.pick.Opts?
---@return boolean
function M.in_worktree(opts)
  opts = opts or {}
  local cwd = vim.F.if_nil(opts.cwd, vim.uv.cwd())
  return require("util.command").get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" }, cwd)[1]
end

--- Get title
---@param title string
---@param search_string string?
function M.get_title(title, search_string)
  title = " " .. title .. " "
  if search_string then
    title = title .. "(" .. search_string:gsub("\n", "\\n") .. ") "
  end
  return title
end

--- Get cwd according to git repository
---@param opts lazyvim.util.pick.Opts?
function M.get_cwd(opts)
  opts = opts or {}
  local cwd = opts.cwd or vim.uv.cwd()
  if opts.root ~= false then
    local git_root, _, _ = require("util.command").get_os_command_output({ "git", "rev-parse", "--show-toplevel" }, cwd)
    cwd = git_root[1]
  end
  return cwd
end

--- Setup options for gitgrep
---@param opts lazyvim.util.pick.Opts?
---@param search_string string?
function M.setup_gitgrep_opts(opts, search_string)
  local cwd = M.get_cwd(opts)
  local cmd = "git -C " .. cwd .. " grep --line-number --column --color=always --untracked"
  return {
    cmd = cmd,
    winopts = { title = M.get_title("Git Grep", search_string) },
    cwd = cwd,
  }
end

--- Setup options for rg
---@param opts lazyvim.util.pick.Opts?
---@param search_string string?
function M.setup_rg_opts(opts, search_string)
  opts.winopts = { title = M.get_title("Grep", search_string) }
  return opts
end

---@param opts lazyvim.util.pick.Opts?
---@return function
function M.find_files(opts)
  opts = opts or {}
  return function()
    if M.in_worktree(opts) then
      require("fzf-lua").git_files({ cwd = M.get_cwd(opts) })
    else
      require("lazyvim.util").pick("files", opts)()
    end
  end
end

---@param opts lazyvim.util.pick.Opts?
---@return function
function M.live_grep(opts)
  opts = opts or {}
  return function()
    if M.in_worktree(opts) then
      require("fzf-lua").live_grep(M.setup_gitgrep_opts(opts))
    else
      require("lazyvim.util").pick("live_grep", opts)()
    end
  end
end

---@param opts lazyvim.util.pick.Opts?
---@return function
function M.grep_cword(opts)
  opts = opts or {}
  return function()
    local search_string = vim.fn.expand("<cword>")
    if M.in_worktree(opts) then
      require("fzf-lua").grep_cword(M.setup_gitgrep_opts(opts, search_string))
    else
      require("lazyvim.util").pick("grep_cword", M.setup_rg_opts(opts, search_string))()
    end
  end
end

---@param opts lazyvim.util.pick.Opts?
---@return function
function M.grep_visual(opts)
  opts = opts or {}
  return function()
    local search_string, _ = require("fzf-lua.utils").get_visual_selection()
    if M.in_worktree(opts) then
      require("fzf-lua").grep_visual(M.setup_gitgrep_opts(opts, search_string))
    else
      require("lazyvim.util").pick("grep_visual", M.setup_rg_opts(opts, search_string))()
    end
  end
end

return M
