-- file explorer plugins

return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        init = function()
          -- toggle the file explorer
          vim.keymap.set('n', '<C-h>', '<cmd>Neotree toggle<CR>')
        end,
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                window = {
                    width = 30,
                    mappings = {
                        ["<space>"] = "open"
                    }
                }
            })
        end,
    },

    --[[
    { 
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
          require("nvim-tree").setup({})
          
          -- toggle the file explorer
          vim.keymap.set('n', '<C-h>', '<cmd>NvimTreeToggle<CR>')
      end,
    },
    --]]
}
