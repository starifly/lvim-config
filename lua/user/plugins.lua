-- Additional Plugins
lvim.plugins = {
  -- python
  {
    "ChristianChiarulli/swenv.nvim",
    -- event = "VeryLazy",
    ft = { "python" },
  },
  {
    -- mason 筛选
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    -- ft = { "python" }
  },
  {
    "mfussenegger/nvim-dap-python",
    -- event = "VeryLazy",
    ft = { "python" },
  },
  {
    "nvim-neotest/neotest",
    -- event = "VeryLazy",
    ft = { "python" },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
  },
  {
    "nvim-neotest/neotest-python",
    -- event = "VeryLazy",
    ft = { "python" },
  },

  {
    "p00f/clangd_extensions.nvim",
    -- event = "VeryLazy",
    ft = { "c", "cpp", "objc", "objcpp", "h", "hpp" },
  },

  {
    "olexsmir/gopher.nvim",
    ft = { "go" },
  },
  {
    "leoluz/nvim-dap-go",
    ft = { "go" },
  },

  -- catppuccin colorscheme
  {
    -- "catppuccin/nvim",
    -- name = "catppuccin",
    -- lazy = false,
    -- priority = 1000,
  },

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
        fold_toggle = "f",
        -- Toggle folds for all nodes.
        -- If at least one node is folded, this action will fold all nodes.
        -- If all nodes are folded, this action will unfold all nodes.
        fold_toggle_all = "F",
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
    -- "osyo-manga/vim-anzu",
    -- event = "VeryLazy",
    -- init = function()
    --   vim.g.anzu_enable_CursorMoved_AnzuUpdateSearchStatus = 1
    -- end
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
    -- nvim-spectre : Search and Replace
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

  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    event = "UIEnter",
    -- lazy = false,
    config = function()
      require("user.noice")
    end,
  },

  {

    "kevinhwang91/nvim-ufo",
    config = function()
      require("user.ufo").config()
    end,
    dependencies = {
      "kevinhwang91/promise-async",
    },
    event = "VeryLazy",
  },
}
