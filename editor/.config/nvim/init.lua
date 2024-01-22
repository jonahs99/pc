-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- start lazy.nvim
require("lazy").setup({
  { "folke/zen-mode.nvim", opts = {
    window = { width = 80, height = 24 },
  } },
  { "mrcjkb/rustaceanvim", ft = { "rust" } },
}, {
  install = { colorscheme = {} },
})

-- custom settings
vim.cmd([[
set tabstop=4
set shiftwidth=4
set expandtab
]])

-- clear all default highlight groups
local hi = vim.api.nvim_exec("hi", true)
for line in hi:gmatch("(.-)\n") do
    local group = vim.trim(line:gmatch("(.-)%s")())
    if group then
        vim.cmd("hi " .. group .. " NONE")
    end
end

-- colors
vim.cmd([[
hi Comment cterm=bold
hi String ctermfg=2
hi Character ctermfg=2
]])

