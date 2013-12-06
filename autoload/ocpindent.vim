let s:current_dir=expand("<sfile>:p:h")
py import sys, vim
py if not vim.eval("s:current_dir") in sys.path:
\    sys.path.append(vim.eval("s:current_dir"))
py import ocpindent

function! ocpindent#init()
endfunction

function! ocpindent#OcpIndentLine()
  let synname = synIDattr(synIDtrans(synID(v:lnum, col('$') - 1, 1)), 'name')
  if synname == "String" || synname == "Comment"
    return -1
  endif
  py vim.command("let l:ret = %d" % ocpindent.vim_indentline())
  return l:ret
endfunction

function! ocpindent#Equal()
  py ocpindent.vim_equal()
endfunction
