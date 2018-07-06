" Run the current file with rspec
map <Leader>rr :silent! w<CR> :silent! VimuxRunCommand("bundle exec rspec " . bufname("%"))<CR>
" Run the current line with rspec
map <Leader>rt :silent! w<CR> :silent! VimuxRunCommand("bundle exec rspec " . bufname("%") . ":" . line("."))<CR>
" Use nearest window if available
let g:VimuxUseNearest = 1 " on be default

" Prompt for a command to run map
map <Leader>vp :silent! w<CR> :silent! VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :silent! w<CR> :silent! VimuxRunLastCommand<CR>
" Inspect runner pane map
map <Leader>vi :silent! w<CR> :silent! VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :silent! w<CR> :silent! VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane map
map <Leader>vs :silent! w<CR> :silent! VimuxInterruptRunner<CR>
" Zoom the tmux runner page
map <Leader>vz :silent! w<CR> :silent! VimuxZoomRunner<CR>
" Vimux Runner height
let g:VimuxHeight = "20"
