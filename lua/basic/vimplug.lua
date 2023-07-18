local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug '~/vim-zui'
vim.call('plug#end')

vim.cmd([[
    autocmd BufRead,BufNewFile *.php setlocal completefunc=zui#complete
    autocmd BufRead,BufNewFile *.php setlocal completeopt=menu,menuone,preview,noinsert
    autocmd BufRead,BufNewFile *.php inoremap <C-f> <C-x><C-u>
    autocmd CompleteDone * pclose
]])

vim.o.splitbelow = true
