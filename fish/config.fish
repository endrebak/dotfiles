
function j
  cd (fasd -d -e 'printf %s' "$argv")
end

function l
 ls -latrh (fasd -d -e 'printf %s' "$argv")
end

function lslatrh
  echo -ne '\n' | eval "  ls -latrh"
end

function fish_user_key_bindings
    bind \cs lslatrh
end

set -g -x R_LIBS "/Library/Frameworks/R.framework/Versions/3.2/Resources/library"
