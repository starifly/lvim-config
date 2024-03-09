-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

reload "user.plugins"
reload "user.keymaps"

vim.loader.enable()

-- general
-- vim.opt.relativenumber = true -- relative line numbers
-- vim.log.levels="debug"
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

-- colorscheme
-- lvim.colorscheme = "catppuccin-mocha"

-- 保存时自动格式化
lvim.format_on_save.enabled = true
-- 禁用自动安装lsp
-- lvim.lsp.installer.setup.automatic_installation = false

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

-- https://github.com/ojroques/nvim-osc52?tab=readme-ov-file#using-nvim-osc52-as-clipboard-provider
local function copy(lines, _)
  require('osc52').copy(table.concat(lines, '\n'))
end

local function paste()
  return { vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('') }
end

vim.g.clipboard = {
  name = 'osc52',
  copy = { ['+'] = copy, ['*'] = copy },
  paste = { ['+'] = paste, ['*'] = paste },
}

-- Now the '+' register will copy to system clipboard using OSC52
vim.keymap.set('n', '<C-c>', '"+y')
-- vim.keymap.set('n', '<C-C>', '"+yy')

-- lualine settings --
-- lvim.builtin.lualine.style = "default" -- or "none"
-- lvim.builtin.lualine.sections = {
-- lualine_a = { 'mode' },
-- }
local function mode_alias()
  local mode_map = {
    n = 'N',
    i = 'I',
    v = 'V',
    V = 'V-Line',
    c = 'C',
    no = 'N-Pending',
    s = 'S',
    S = 'S-Line',
    [''] = 'S-Block',
    ic = 'I-C',
    R = 'R',
    Rv = 'V-R',
    cv = 'Vim Ex',
    ce = 'Ex',
    r = 'P',
    rm = 'M',
    ['r?'] = 'C',
    ['!'] = 'Sh',
    t = 'T',
  }

  return mode_map[vim.fn.mode()]
end
lvim.builtin.lualine.sections.lualine_a = { mode_alias }

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

-- modify nvim-tree default keymaps
local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'gp', api.node.open.preview, opts('Open Preview'))
  vim.keymap.del('n', '<Tab>', opts('Open Preview'))
end

lvim.builtin.nvimtree.setup.on_attach = my_on_attach
