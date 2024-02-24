lvim.keys.normal_mode["<M-q>"] = "<cmd>qa<cr>"
lvim.keys.insert_mode["<M-q>"] = "<cmd>qa<cr>"
lvim.keys.normal_mode["<M-Q>"] = "<cmd>BufferKill<cr>"
lvim.keys.insert_mode["<M-Q>"] = "<cmd>BufferKill<cr>"
lvim.keys.normal_mode["<M-w>"] = "<cmd>update<cr>"
lvim.keys.insert_mode["<M-w>"] = "<cmd>update<cr>"
lvim.keys.normal_mode["<M-W>"] = "<cmd>wqa<cr>"
lvim.keys.insert_mode["<M-W>"] = "<cmd>wqa<cr>"
lvim.keys.normal_mode["<C-Left>"] = "<cmd>bprev<cr>"
lvim.keys.normal_mode["<C-Right>"] = "<cmd>bnext<cr>"
lvim.keys.normal_mode["<Tab>"] = "<c-w>w"
lvim.keys.normal_mode["<S-Tab>"] = "<c-w>W"

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
