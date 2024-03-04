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
      keymaps = {
        fold_toggle = 'f',
        -- Toggle folds for all nodes.
        -- If at least one node is folded, this action will fold all nodes.
        -- If all nodes are folded, this action will unfold all nodes.
        fold_toggle_all = 'F',
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

  {
    -- 'kevinhwang91/nvim-hlslens',
    -- 搜索显示数量
    "osyo-manga/vim-anzu",
    event = "VeryLazy",
    init = function()
      vim.g.anzu_enable_CursorMoved_AnzuUpdateSearchStatus = 1
    end
    -- config = function()
    --   require("user.hlslens")
    -- end
  },

  -- {
  --   -- 优化搜索，移动光标后清除高亮
  --   "romainl/vim-cool",
  --   event = "VeryLazy",
  -- },

  {
    -- 支持查找光标下的字符串
    "nvim-telescope/telescope-live-grep-args.nvim",
    event = "VeryLazy",
  },

  {
    -- gxt_kt nvim-spectre : Search and substitute
    "windwp/nvim-spectre",
    event = "VeryLazy",
    config = function()
      require("user.spectre")
    end,
  },

  {
    -- 解决跨系统剪贴板问题
    -- neovim 0.10开始会原生支持osc52
    "ojroques/nvim-osc52",
    event = "VeryLazy",
  },
}
