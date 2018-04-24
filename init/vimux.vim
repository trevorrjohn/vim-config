" Run the current file with rspec
map <Leader>rb :call VimuxRunCommand("rspec " . bufname("%"))<CR>
" Use nearest window if available
let g:VimuxUseNearest = 1 " on be default

" Prompt for a command to run map
map <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane map
map <Leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane map
map <Leader>vs :VimuxInterruptRunner<CR>
" Zoom the tmux runner page
map <Leader>vz :VimuxZoomRunner<CR>
" Vimux Runner height
let g:VimuxHeight = "20"
