#!/usr/bin/bash
set -e
set -o pipefail
set -x

nvim --version
mkdir -p ~/.config/nvim
echo '
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
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  {
    "siadat/shell.nvim",
    opts = {},
  },
})
' > ~/.config/nvim/init.lua
nvim +'sleep 5 | q'
nvim +'set nowrap' +'Shell ls -lash' +vs +'Shell --no-follow ps aux --forest'