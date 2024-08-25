local M = {}

local Opts = require("plugins.fuzzy_finder.fzf-lua.opts")

---@alias FzfCmdType "files" | "rg" | "git_files" | "git_grep"

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

--- Setup options for live git grep
---@param opts lazyvim.util.pick.Opts?
function M.setup_live_gitgrep_opts(opts)
  local cwd = M.get_cwd(opts)
  local pathspec = require("plugins.fuzzy_finder.fzf-lua.menu").get_pathspec_string("git_grep")
  print("pathspec: " .. pathspec)
  return {
    raw_cmd = "git -C " .. cwd .. " grep --line-number --column --color=always --untracked <query> " .. pathspec, -- HACK: Use 'raw_cmd' to prevent <query> appending
    winopts = { title = M.get_title("Git Grep") },
    cwd = cwd,
  }
end

--- Setup options for git grep with search query
---@param opts lazyvim.util.pick.Opts?
---@param search_string string
function M.setup_search_gitgrep_opts(opts, search_string)
  local cwd = M.get_cwd(opts)
  local query = vim.fn.shellescape(search_string)
  local pathspec = require("plugins.fuzzy_finder.fzf-lua.menu").get_pathspec_string("git_grep")
  print("pathspec: " .. pathspec)
  return {
    raw_cmd = "git -C " .. cwd .. " grep --line-number --column --color=always --untracked " .. query .. " " .. pathspec, -- HACK: Use 'raw_cmd' to prevent <query> appending
    winopts = { title = M.get_title("Git Grep", search_string) },
    cwd = cwd,
  }
end

--- Setup options for live rg
---@param opts lazyvim.util.pick.Opts?
function M.setup_live_rg_opts(opts)
  local cwd = M.get_cwd(opts)
  local pathspec = require("plugins.fuzzy_finder.fzf-lua.menu").get_pathspec_string("rg")
  print("pathspec: " .. pathspec)
  return {
    rg_opts = require("fzf-lua").defaults.grep.rg_opts:gsub("-e", "") .. " " .. pathspec .. " -e",
    winopts = { title = M.get_title("Grep") },
    cwd = cwd,
  }
end

--- Setup options for search rg
---@param opts lazyvim.util.pick.Opts?
---@param search_string string
function M.setup_search_rg_opts(opts, search_string)
  local cwd = M.get_cwd(opts)
  local query = vim.fn.shellescape(search_string)
  local pathspec = require("plugins.fuzzy_finder.fzf-lua.menu").get_pathspec_string("rg")
  return {
    rg_opts = require("fzf-lua").defaults.grep.rg_opts:gsub("-e", "") .. " " .. pathspec .. " -e",
    winopts = { title = M.get_title("Grep", search_string) },
    cwd = cwd,
    search = query,
  }
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
      require("fzf-lua").live_grep(M.setup_live_gitgrep_opts(opts))
    else
      require("fzf-lua").live_grep(M.setup_live_rg_opts(opts))
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
      require("fzf-lua").grep(M.setup_search_gitgrep_opts(opts, search_string))
    else
      require("fzf-lua").grep(M.setup_search_rg_opts(opts, search_string))
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
      require("fzf-lua").grep(M.setup_search_gitgrep_opts(opts, search_string))
    else
      require("fzf-lua").grep(M.setup_search_rg_opts(opts, search_string))
    end
  end
end

return M
