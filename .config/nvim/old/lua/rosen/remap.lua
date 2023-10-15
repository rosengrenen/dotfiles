vim.g.mapleader = " "

-- Basic movement
vim.keymap.set("", "<up>", "<nop>")
vim.keymap.set("", "<right>", "<nop>")
vim.keymap.set("", "<down>", "<nop>")
vim.keymap.set("", "<left>", "<nop>")
-- vim.keymap.set("n", "m", "h")
-- vim.keymap.set("n", "n", "gj")
-- vim.keymap.set("n", "e", "gk")
-- vim.keymap.set("n", "i", "l")
-- vim.keymap.set("n", "t", "i")
-- vim.keymap.set("n", "k", "n")
-- vim.keymap.set("n", "K", "N")

-- Visual
-- vim.keymap.set("v", "m", "h")
-- vim.keymap.set("v", "n", "gj")
-- vim.keymap.set("v", "e", "gk")
-- vim.keymap.set("v", "i", "l")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
