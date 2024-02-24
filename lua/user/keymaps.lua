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
lvim.builtin.which_key.mappings["o"] = {"<cmd>Outline<cr>", "Toggle outline"}
