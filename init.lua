local indentWidth = 4

--[[*** OPTIONS ***]]--
-- GENERAL
-- set numbered lines
vim.opt.number = true

-- set global clipboard
vim.opt.clipboard = "unnamed"

-- set syntax highlighting on
vim.opt.syntax = "enable"

-- nerd font installed ?
vim.g.have_nerd_font = true


-- INDENTATION
-- set autoindent on (based on current line)
vim.opt.autoindent = true

-- set smart indent on (based on the style used in the file)
vim.opt.smartindent = true

-- use spaces not tabs
vim.opt.expandtab = true

-- each tab is displayed as indentWidth spaces
vim.opt.tabstop = indentWidth

-- number of spaces inserted for each indentation
vim.opt.shiftwidth = indentWidth

-- treat indentWidth consecutives spaces as if they were tabs on backspace
vim.opt.softtabstop = indentWidth



-- SEARCH
-- ignore case during search
vim.opt.ignorecase = true

-- don't ignore case if in the search pattern there's an upper case char.
vim.opt.smartcase = true

-- highlight during search but clear on <Esc>
vim.opt.hlsearch = true


-- UI
-- show show tabs as ">", trailing spaces as "-", etc... (see :help 'list')
vim.opt.list = true
vim.opt.listchars = {
    tab = "┊ ",
    trail = " ",
    extends = "»",
    precedes = "«",
    nbsp = "×"
}

-- allow mouse in normal mode only
vim.opt.mouse = 'n'

-- minimum number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- same as before but for screen columns
vim.opt.sidescrolloff = 10

-- new split opens on the right
vim.opt.splitright = true

-- new split opens below
vim.opt.splitbelow = true

-- wrap text
vim.opt.wrap = true

-- don't show the mode (n,i,v,...), it's already in the status line
vim.opt.showmode = false



-- PERFORMANCE
-- wait 300ms for a mapped sequence to complete
vim.opt.timeoutlen = 300



--[[*** KEYMAPS ***]]--
-- clear search highlight on <Esc> 
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')



--[[*** PLUGINS ***]]--
-- install lazy.nvim on startup if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
-- add lazypath to the nvim runtime path
vim.opt.rtp:prepend(lazypath)

-- load plugins directly from ./lua/plugins/*
require("lazy").setup("plugins")
