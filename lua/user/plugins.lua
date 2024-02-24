-- Additional Plugins
lvim.plugins = {
  -- python
  {
    "ChristianChiarulli/swenv.nvim",
    lazy = true,
    ft = { "python" }
  },
  {
    "stevearc/dressing.nvim",
    lazy = true,
    ft = { "python" }
  },
  {
    "mfussenegger/nvim-dap-python",
    lazy = true,
    ft = { "python" }
  },
  {
    "nvim-neotest/neotest",
    lazy = true,
    ft = { "python" }
  },
  {
    "nvim-neotest/neotest-python",
    lazy = true,
    ft = { "python" }
  },

  -- catppuccin colorscheme
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  -- },

  -- outline
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    opts = {
      -- Your setup opts here
      outline_window = {
        width = 20,
      },
    },
  },

  -- code runner
  {
    "CRAG666/code_runner.nvim",
    event = "VeryLazy",
    -- dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("user.coderunner")
    end,
  },

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    ft = { "markdown" },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      -- vim.g.mkdp_auto_start = 1
    end,
  },
}
