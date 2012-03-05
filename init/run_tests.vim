" Run a test tool with the current file and line number
" The test tool is run in the last Terminal window
function! RunTestTool(tool_cmd)
  let dir = system('pwd')
  let applescript = "osascript -e '".'tell application "Terminal"'
  let applescript .= "\n"
  let applescript .= 'do script "cd '.dir.'" in last window'
  let applescript .= "\n"
  let applescript .= 'do script "'.a:tool_cmd.'" in last window'
  let applescript .= "\n"
  let applescript .= 'end tell'."'"
  let foo = system(applescript)
endfunction

" If the file ends with _spec.rb, RunTestTool with rspec
" If the file ends with .feature, RunTestTool with cuke
command! RunFocusedTest :call RunFocusedTest()
function! RunFocusedTest()
  let spec_command = system('if [ x != "x"$(which spec) ] ; then echo -n spec ; elif [ x != "x"$(which rspec) ] ; then echo -n rspec ; fi')
  let filename = expand("%")
  if filename =~ '_spec\.rb$'
    call RunTestTool("be ".spec_command." ".expand("%").":".line("."))
  endif
  if filename =~ '\.feature$'
    call RunTestTool("cuke ".expand("%").":".line("."))
  endif
endfunction

command! RunTests :call RunTests()
function! RunTests()
  let spec_command = system('if [ x != "x"$(which spec) ] ; then echo -n spec ; elif [ x != "x"$(which rspec) ] ; then echo -n rspec ; fi')
  let filename = expand("%")
  if filename =~ '_spec\.rb$'
    call RunTestTool("be ".spec_command." ".expand("%"))
  endif
  if filename =~ '\.feature$'
    call RunTestTool("cuke ".expand("%"))
  elseif filename =~ '.rb'
    let splitFilename = split(filename, '\/')
    let folders = splitFilename[1:-2]
    let shortenedName = split(splitFilename[-1], '\.rb')[0]

    let testFilename = "spec/"
    for folder in folders
      let testFilename = testFilename.folder."/"
    endfor
    let testFilename = testFilename.shortenedName."_spec.rb"
    call RunTestTool("bundle exec rspec ".testFilename)
  endif
endfunction
