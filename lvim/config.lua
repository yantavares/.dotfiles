-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- Define plugins to be installed
lvim.plugins = {
  {
    "f-person/git-blame.nvim",
    event = "BufRead", -- Load the plugin on buffer read
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment" -- Set the highlight link for git blame
      require("gitblame").setup { enabled = false } -- Configure git-blame plugin
    end,
  },
}

