-- Additional Plugins
lvim.plugins = {
  -- python
  {
    "ChristianChiarulli/swenv.nvim",
    event = "VeryLazy",
    ft = { "python" }
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    ft = { "python" }
  },
  {
    "mfussenegger/nvim-dap-python",
    event = "VeryLazy",
    ft = { "python" }
  },
  {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    ft = { "python" }
  },
  {
    "nvim-neotest/neotest-python",
    event = "VeryLazy",
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
        event = 'UIEnter',
  -- lazy = false,
  config = function()
    require("noice").setup({
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      routes = {
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        },
      },
      cmdline = {
        view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        format = {
          cmdline = { pattern = "^:", icon = "|>", lang = "vim", title = "" },
        }
      },
      views = {
        cmdline_popup = {
          size = {
            height = "auto",
            width = "90%",
          },
          position = {
            row = "90%",
            col = "50%",
          },
          border = {
            style = "single"
          },
        },
      },
    })
  end,
  },
}
