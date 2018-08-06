let g:fzf_layout = { 'down': '~15%' }
let g:fzf_history_dir = '~/.local/share/fzf-history'

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
