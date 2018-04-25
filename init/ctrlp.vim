let g:ctrlp_map = '<leader>f'

" https://github.com/kien/ctrlp.vim/issues/174
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard | sort -r']
" let g:ctrlp_user_command = 'rg --literal --files-with-matches --nocolor --hidden --filename-pattern "" %s'

let g:ctrlp_path_nolim = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
