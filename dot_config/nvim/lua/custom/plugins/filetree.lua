local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Open Neotree
map('n', '<leader>t', '<Cmd>Neotree position=current<CR>', opts)

require('which-key').register {
  ['<leader>t'] = { name = 'Open NeoTree', _ = 'which_key_ignore' },
}
-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup {
      filesystem = {
        follow_current_file = {
          enable = true,
        },
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignore = false,
        },
        hijack_netrw_behavior = "open_current",
      }
    }
  end,
}
