return {
  { import = "lazyvim.plugins.extras.editor.fzf" },
  {
    "ibhagwan/fzf-lua",
    opts = function(_, fzf_opts)
      local opts = {}

      -- winopts
      local keymap = {
        -- motion
        { key = "j", action = "<Down>" },
        { key = "k", action = "<Up>" },
        { key = "<Down>", action = "<Down>" },
        { key = "<Up>", action = "<Up>" },
        { key = "gg", action = "<A-G>" }, -- first
        { key = "G", action = "<A-g>" }, -- end
        { key = "<C-u>", action = "<C-u>" }, -- page-up
        { key = "<C-d>", action = "<C-d>" }, --page-down
        { key = "s", action = "<C-x>", insert = true }, -- jump
        -- preview
        { key = "J", action = "<C-f>" },
        { key = "K", action = "<C-b>" },
        -- quit
        { key = "q", action = "<Esc>" },
        -- select
        { key = "<Enter>", action = "<Enter>" },
      }
      opts.winopts = {
        on_create = function()
          for _, keybind in ipairs(keymap) do
            vim.keymap.set("n", keybind.key, function()
              vim.cmd("startinsert")
              vim.api.nvim_input(keybind.action)
              if (keybind.insert == nil) or (keybind.insert ~= true) then
                vim.schedule(function()
                  vim.cmd("stopinsert")
                end)
              end
            end, { buffer = true })
          end
        end,
      }

      return vim.tbl_deep_extend("force", fzf_opts, opts)
    end,
  },
}
