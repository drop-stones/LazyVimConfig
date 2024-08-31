local Opts = {}

local Menu = require("plugins.fuzzy_finder.fzf-lua.menu")

---@class FzfOpts
---@field cmd string?
---@field raw_cmd string?
---@field winopts table<string, string>
---@field cwd string
---@field query string?

--- Get title
---@param title string
---@param search_string string?
local get_title = function(title, search_string)
  title = " " .. title .. " "
  if search_string then
    title = title .. "(" .. search_string:gsub("\n", "\\n") .. ") "
  end
  return title
end

--- Get cwd according to git repository
---@param opts lazyvim.util.pick.Opts?
---@return string?
local get_cwd = function(opts)
  opts = opts or {}
  local cwd = opts.cwd or vim.uv.cwd()
  if opts.root ~= false then
    local git_root, _, _ = require("util.command").get_os_command_output({ "git", "rev-parse", "--show-toplevel" }, cwd)
    cwd = git_root[1]
  end
  return cwd
end

---@param cwd string?
---@param query string?
---@return string
function Opts.get_gitgrep_cmd(cwd, query)
  local pathspec = require("plugins.fuzzy_finder.fzf-lua.menu").get_pathspec_string("git_grep")
  if (query == nil) or (query == "") then
    query = "<query>"
  end
  cwd = (cwd and "-C " .. cwd) or ""
  return "git " .. cwd .. " grep --line-number --column --color=always --untracked -I " .. query .. " " .. pathspec -- HACK: Use 'raw_cmd' to prevent <query> appending
end

---@return string
function Opts.get_rg_opts()
  local pathspec = require("plugins.fuzzy_finder.fzf-lua.menu").get_pathspec_string("rg")
  return require("fzf-lua").defaults.grep.rg_opts:gsub("-e", "") .. " " .. pathspec .. " -e"
end

---Setup options for files
---@param opts lazyvim.util.pick.Opts?
---@return FzfOpts
function Opts.setup_files_opts(opts)
  return {
    cwd = get_cwd(opts),
  }
end

--- Setup options for live git grep
---@param opts lazyvim.util.pick.Opts?
---@return FzfOpts
function Opts.setup_live_gitgrep_opts(opts)
  local cwd = get_cwd(opts)
  return {
    raw_cmd = Opts.get_gitgrep_cmd(cwd),
    winopts = { title = get_title("Git Grep") },
    cwd = cwd,
    header = Menu.get_pathspec_header(),
  }
end

--- Setup options for git grep with search query
---@param opts lazyvim.util.pick.Opts?
---@param search string
---@return FzfOpts
function Opts.setup_search_gitgrep_opts(opts, search)
  local cwd = get_cwd(opts)
  local query = vim.fn.shellescape(search)
  return {
    raw_cmd = Opts.get_gitgrep_cmd(cwd, query),
    winopts = { title = get_title("Git Grep", search) },
    cwd = cwd,
    search = search, -- HACK: to resume this search function
    header = Menu.get_pathspec_header(),
  }
end

--- Setup options for live rg
---@param opts lazyvim.util.pick.Opts?
---@return FzfOpts
function Opts.setup_live_rg_opts(opts)
  local cwd = get_cwd(opts)
  local pathspec = require("plugins.fuzzy_finder.fzf-lua.menu").get_pathspec_string("rg")
  return {
    rg_opts = require("fzf-lua").defaults.grep.rg_opts:gsub("-e", "") .. " " .. pathspec .. " -e",
    winopts = { title = get_title("Grep") },
    cwd = cwd,
    header = Menu.get_pathspec_header(),
  }
end

--- Setup options for search rg
---@param opts lazyvim.util.pick.Opts?
---@param search string
---@return FzfOpts
function Opts.setup_search_rg_opts(opts, search)
  local cwd = get_cwd(opts)
  local query = vim.fn.shellescape(search)
  return {
    rg_opts = Opts.get_rg_opts(),
    winopts = { title = get_title("Grep", search) },
    cwd = cwd,
    search = query,
    header = Menu.get_pathspec_header(),
  }
end

return Opts
