local keymap = vim.keymap

keymap.set("n", "<leader>d", '"_d')
keymap.set("n", "x", '"_x')
keymap.set("n", "<C-t>", ":NeoTreeShow<CR>")
keymap.set("n", "<C-f>", ":NeoTreeFocus<CR>")
keymap.set("n", "<C-z>", ":undo<CR>")
keymap.set("n", "<C-r>", ":redo<CR>")
keymap.set("i", "<C-z>", "<Esc>:undo<CR>")
keymap.set("i", "<C-r>", "<Esc>:redo<CR>")
keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("n", "<S-Up>", "v<Up>")
keymap.set("n", "<S-Down>", "v<Down>")
keymap.set("n", "<S-Left>", "v<Left>")
keymap.set("n", "<S-Right>", "v<Right>")

keymap.set("v", "<S-Up>", "<Up>")
keymap.set("v", "<S-Down>", "<Down>")
keymap.set("v", "<S-Left>", "<Left>")
keymap.set("v", "<S-Right>", "<Right>")

keymap.set("i", "<S-Up>", "<Esc>v<Up>")
keymap.set("i", "<S-Down>", "<Esc>v<Down>")
keymap.set("i", "<S-Left>", "<Esc>v<Left>")
keymap.set("i", "<S-Right>", "<Esc>v<Right>")

keymap.set("v", "<C-c>", '"+y<Esc>')
keymap.set("v", "<C-x>", '"+d<Esc>i')
keymap.set("i", "<C-v>", "<Esc>pi")

--keymap.set("i", "<C-Backspace>", '<Esc>dbi')
--keymap.set("i", "<C-Del>", '<Esc>dw')
keymap.set("i", "<C-H>", "<C-w>")
keymap.set("i", "<C-Backspace>", "<C-w>")
keymap.set("n", "<C-Del>", "dw")

keymap.set("n", "<C-A-Up>", "<PageUp>")
keymap.set("n", "<C-A-Down>", "<PageDown>")

keymap.set("v", "<C-A-Up>", "<PageUp>")
keymap.set("v", "<C-A-Down>", "<PageDown>")

keymap.set("i", "<C-A-Up>", "<PageUp>")
keymap.set("i", "<C-A-Down>", "<PageDown>")

keymap.set("n", "<C-Space>", ":Telescope find_files<CR>")

keymap.set("n", "<C-n>", ":tabedit<CR>")
keymap.set("n", "<A-Tab>", ":BufferNext<CR>")
keymap.set("n", "<S-Tab>", ":BufferPrevious<CR>")
keymap.set("n", "<A-q>", ":BufferClose<CR>")

keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })
