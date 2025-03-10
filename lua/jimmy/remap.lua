vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pd", '<cmd>lua MiniFiles.open()<cr>')

vim.keymap.set({ "n", "v", "o" }, "H", "^");
vim.keymap.set({ "n", "v", "o" }, "L", "$");

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "gn", "nzzzv")
vim.keymap.set("n", "gN", "Nzzzv")

-- go to beginning of the next function
vim.keymap.set("n", "gk", "[m")
-- go to beginning of the previous function
vim.keymap.set("n", "gK", "[M")
-- go to end of the next function
vim.keymap.set("n", "gj", "]m")
-- go to the end of the previous function
vim.keymap.set("n", "gJ", "]M")

-- go back to where you were and go forward to where you are
vim.keymap.set("n", "gb", "<C-O>zz")
vim.keymap.set("n", "gf", "<C-I>zz")


-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])


-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "Y", "^y$")

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "==", vim.lsp.buf.format)

-- not sure what these commands do, but they are overlapping with other commands
-- will need to change when I figure out
--vim.keymap.set("n", "ge", "<cmd>cnext<CR>zz")
--vim.keymap.set("n", "gE", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "gl", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "gL", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Telekasten remaps
vim.keymap.set("n", "<leader>zp", "<cmd>Telekasten panel<CR>")

vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")

-- Call insert link automatically when we start typing a link
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
