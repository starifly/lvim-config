lvim.keys.normal_mode["<M-q>"] = "<cmd>qa<cr>"
lvim.keys.insert_mode["<M-q>"] = "<cmd>qa<cr>"
lvim.keys.normal_mode["<M-Q>"] = "<cmd>BufferKill<cr>"
lvim.keys.insert_mode["<M-Q>"] = "<cmd>BufferKill<cr>"
lvim.keys.normal_mode["<C-x>"] = "<cmd>bd<cr>"
lvim.keys.normal_mode["<M-w>"] = "<cmd>update<cr>"
lvim.keys.insert_mode["<M-w>"] = "<cmd>update<cr>"
lvim.keys.normal_mode["<M-W>"] = "<cmd>wqa<cr>"
lvim.keys.insert_mode["<M-W>"] = "<cmd>wqa<cr>"
lvim.keys.normal_mode["<C-Left>"] = "<cmd>bprev<cr>"
lvim.keys.normal_mode["<C-Right>"] = "<cmd>bnext<cr>"
lvim.keys.normal_mode["<Tab>"] = "<c-w>w"
lvim.keys.normal_mode["<S-Tab>"] = "<c-w>W"
-- 错误或警告跳转
lvim.keys.normal_mode["<C-n>"] = "<cmd>lua vim.diagnostic.goto_next()<CR>"
lvim.keys.normal_mode["<C-p>"] = "<cmd>lua vim.diagnostic.goto_prev()<CR>"

-- plugin vim-anzu
-- 使用 n/N 跳转到下一个/上一个匹配项时显示匹配计数
lvim.keys.normal_mode["n"] = "<Plug>(anzu-n-with-echo)"
lvim.keys.normal_mode["N"] = "<Plug>(anzu-N-with-echo)"
-- 使用 * 或 # 搜索光标下的单词时显示匹配计数
lvim.keys.normal_mode["*"] = "<Plug>(anzu-star-with-echo)"
lvim.keys.normal_mode["#"] = "<Plug>(anzu-sharp-with-echo)"
-- 设置快捷键来清除搜索高亮并关闭 anzu 的匹配计数显示
-- lvim.keys.normal_mode[""] = ":nohlsearch<CR>:AnzuClearEcho"

-- 利用telescope查找光标下的字符串
lvim.builtin.which_key.vmappings["sw"] = {
  "<Esc>:lua require('user.functions').live_grep_raw({default_text=''}, 'v')<cr>",
  "Find Selection" }
lvim.builtin.which_key.mappings["sw"] = {
  ":lua require('user.functions').live_grep_raw({default_text = vim.fn.expand('<cword>')})<cr>", "Find Word" }

-- plugin outline
lvim.builtin.which_key.mappings["o"] = { "<cmd>Outline<cr>", "Toggle outline" }

-- plugin code_runner
lvim.builtin.which_key.mappings["r"] = {
  name = "Run",
  s = {
    '<cmd>autocmd bufwritepost [^_]*.sass,[^_]*.scss  silent exec "!sass %:p %:r.css"<CR>',
    "Auto Compile Sass",
  },
  r = { "<cmd>RunCode<CR>", "Run Code" },
  f = { "<cmd>RunFile<CR>", "Run File" },
  p = { "<cmd>RunProject<CR>", "Run Project" },
  g = { "<cmd>ToggleTerm size=70 direction=vertical<cr>gradle run<cr>", "Run Gradle" },
  m = {
    "<cmd>ToggleTerm size=70 direction=vertical<cr>mvn exec:java -Dexec.mainClass=com.code.App<cr>",
    "Run MVN",
  },
}

-- plugin nvim-spectre
-- 单词前后输入\b以精确匹配
lvim.builtin.which_key.mappings["R"] = {
  name = "Replace",
  f = { ":lua require('spectre').open_file_search()<CR>", "Search And Replace On Current File" },
  F = { ":lua require('spectre').open()<CR>", "Search And Replace In Whole Workspace" },
  w = { "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>", "Search Current Word On Current File" },
  W = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search Current Word In Whole Workspace" },
}
vim.keymap.set('v', 'Rw',
  '<esc><cmd>lua require("spectre").open({ search_text=require("user.functions").get_text("v"), path=require("user.functions").GetBufRelativePath()})<CR>',
  {
    desc = "Search Selection And Replace On Current File"
  })
vim.keymap.set('v', 'RW',
  '<esc><cmd>lua require("spectre").open({ search_text=require("user.functions").get_text("v") })<CR>',
  {
    desc = "Search Selection And Replace In Whole Workspace"
  })

-- plugin nvim-osc52
vim.keymap.set('n', '<C-c>', require('osc52').copy_operator, { expr = true })
-- vim.keymap.set('n', '<C-C>', '<C-c>_', { remap = true })
vim.keymap.set('v', '<C-c>', require('osc52').copy_visual)
