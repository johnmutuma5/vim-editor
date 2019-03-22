" we don't need to wrap the autocommand file below in an augroup; vim does
" that for us for the contents of ftdetect/*vim
autocmd BufNewFile,BufRead *.pn :setfiletype potion
