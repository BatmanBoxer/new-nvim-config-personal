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
vim.api.nvim_exec([[
    augroup transparency
        autocmd!
        autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE
        autocmd VimEnter * hi NonText guibg=NONE ctermbg=NONE
        autocmd VimEnter * hi LineNr guibg=NONE ctermbg=NONE
    augroup END
]], false)
require("vim-options")
require("lazy").setup("plugins")
