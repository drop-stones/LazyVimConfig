return {
  -- Harpoon2: go to the files you want
  { import = "lazyvim.plugins.extras.editor.harpoon2" },
  {
    "ThePrimeagen/harpoon",
    keys = function(_, keys)
      local new_keys = {}

      -- remove <leader>%d
      for _, v in ipairs(keys) do
        if string.match(v[1], "<leader>%d") == nil then
          table.insert(new_keys, v)
        end
      end

      return new_keys
    end,
  },
}
