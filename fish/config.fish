function -e fish_preexec _run_fasd
  fasd --proc (fasd --sanitize "$argv") > "/dev/null" 2>&1
end

function j
  cd (fasd -d -e 'printf %s' "$argv")
end

function l
  ls -latrh (fasd -d -e 'printf %s' "$argv")
end

function e
  fasd -f -e emacs 'printf %s' "$argv"
end
