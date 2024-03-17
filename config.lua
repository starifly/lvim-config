-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

reload("user.plugins")
reload("user.autocmd")
reload("user.keymaps")

vim.loader.enable()

lvim.log.level = "warn"

-- general
-- vim.opt.relativenumber = true -- relative line numbers
-- vim.log.levels="debug"
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = false
vim.opt.confirm = true        -- 退出时确认
vim.opt.shadafile = ""
vim.opt.autowrite = true      -- Enable auto write
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.pumblend = 10         -- Popup blend
vim.opt.pumheight = 10        -- Maximum number of entries in a popup
vim.opt.scrolloff = 4         -- Lines of context
vim.opt.shiftround = true     -- Round indent
vim.opt.showmode = false      -- Dont show mode since we have a statusline
vim.opt.sidescrolloff = 8     -- Columns of context
vim.opt.signcolumn = "yes"    -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true      -- Don't ignore case with capitals
vim.opt.smartindent = true    -- Insert indents automatically
vim.opt.splitbelow = true     -- Put new windows below current
vim.opt.splitkeep = "screen"
vim.opt.splitright = true     -- Put new windows right of current
vim.opt.tabstop = 2           -- Number of spaces tabs count for
vim.opt.updatetime = 200      -- Save swap file and trigger CursorHold
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
if vim.fn.has("nvim-0.10") == 1 then
  vim.opt.smoothscroll = true
end
-- for ufo plugin
vim.opt.foldcolumn = '0' -- '0' is not bad
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
--

-- colorscheme
-- lvim.colorscheme = "catppuccin-mocha"
lvim.colorscheme = "tokyonight-moon"

-- 保存时自动格式化
lvim.format_on_save.enabled = true
-- 禁用自动安装lsp
lvim.lsp.installer.setup.automatic_installation = false

-- restore last position
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  group = vim.api.nvim_create_augroup("pos_group", { clear = true }),
  command = [[
    if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        exe "normal! g`\""
    endif
    ]],
})

-- 大文件读取优化
vim.cmd([[
augroup LargeFile
        let g:large_file = 3145728 " 3MB

        " Set options:
        "   eventignore+=FileType (no syntax highlighting etc
        "   assumes FileType always on)
        "   noswapfile (save copy of file)
        "   bufhidden=unload (save memory when other file is viewed)
        "   buftype=nowritefile (is read-only)
        "   undolevels=-1 (no undo possible)
        au BufReadPre *
                \ let f=expand("<afile>") |
                \ if getfsize(f) > g:large_file |
                        \ set eventignore+=FileType |
                        \ setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 filetype=off lazyredraw eventignore=all nohidden syntax=off
                \ else |
                        \ set eventignore-=FileType |
                \ endif
augroup END
]])

-- https://github.com/ojroques/nvim-osc52?tab=readme-ov-file#using-nvim-osc52-as-clipboard-provider
local function copy(lines, _)
  require("osc52").copy(table.concat(lines, "\n"))
end

local function paste()
  return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
end

vim.g.clipboard = {
  name = "osc52",
  copy = { ["+"] = copy, ["*"] = copy },
  paste = { ["+"] = paste, ["*"] = paste },
}

-- Now the '+' register will copy to system clipboard using OSC52
vim.keymap.set("n", "<C-c>", '"+y')
-- vim.keymap.set('n', '<C-C>', '"+yy')

-- lualine settings --
-- lvim.builtin.lualine.style = "default" -- or "none"
-- lvim.builtin.lualine.sections = {
--   lualine_a = { 'mode' },
-- }
local function mode_alias()
  local mode_map = {
    ["n"] = "N",
    ["no"] = "O-PENDING",
    ["nov"] = "O-PENDING",
    ["noV"] = "O-PENDING",
    ["no\22"] = "O-PENDING",
    ["niI"] = "N",
    ["niR"] = "N",
    ["niV"] = "N",
    ["nt"] = "N",
    ["ntT"] = "N",
    ["v"] = "V",
    ["vs"] = "V",
    ["V"] = "V-LINE",
    ["Vs"] = "V-LINE",
    ["\22"] = "V-BLOCK",
    ["\22s"] = "V-BLOCK",
    ["s"] = "S",
    ["S"] = "S-LINE",
    ["\19"] = "S-BLOCK",
    ["i"] = "I",
    ["ic"] = "I",
    ["ix"] = "I",
    ["R"] = "R",
    ["Rc"] = "R",
    ["Rx"] = "R",
    ["Rv"] = "V-REPLACE",
    ["Rvc"] = "V-REPLACE",
    ["Rvx"] = "V-REPLACE",
    ["c"] = "C",
    ["cv"] = "EX",
    ["ce"] = "EX",
    ["r"] = "R",
    ["rm"] = "MORE",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "T",
  }

  return mode_map[vim.fn.mode()]
end
lvim.builtin.lualine.sections.lualine_a = { mode_alias }

local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.sections.lualine_x = {
  components.diagnostics,
  "encoding",
  components.filetype,
  components.lsp,
  components.treesitter,
  -- components.spaces,
}

-- -- diable lsp virtual text --
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, {
--     -- disable virtual text
--     virtual_text = true,
--     -- show signs
--     signs = true,
--     -- delay update diagnostics
--     update_in_insert = false,
--   }
-- )

-- disabling core plugins
-- lvim.builtin.which_key.active = false

lvim.builtin.telescope.theme = "center"

-- modify nvim-tree default keymaps
local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
  vim.keymap.set("n", "gp", api.node.open.preview, opts("Open Preview"))
  vim.keymap.del("n", "<Tab>", opts("Open Preview"))
end

lvim.builtin.nvimtree.setup.on_attach = my_on_attach

-- 启用命令行补全
lvim.builtin.cmp.cmdline.enable = true

lvim.lazy.opts.defaults.lazy = true

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "cpp",
  "json",
  "lua",
  "python",
  "yaml",
}

-- 自定义图标
lvim.icons.kind.Constant = "󰏿"
lvim.icons.kind.Constructor = ""
lvim.icons.kind.Enum = " "
lvim.icons.kind.EnumMember = " "
lvim.icons.kind.Field = " "
lvim.icons.kind.Function = "󰊕"
lvim.icons.kind.Interface = " "
lvim.icons.kind.Key = "󰌋"
lvim.icons.kind.Namespace = "󰦮 "
lvim.icons.kind.Snippet = " " -- ""," "," "
lvim.icons.kind.String = ""
lvim.icons.kind.Variable = "󰀫"

-- 加载自定义snippets
-- 在线转换：https://snippet-generator.app/
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/lvim/snippets" })
