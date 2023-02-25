
if status is-interactive
    # Commands to run in interactive sessions can go here

function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
end

set_color '#ca921d'


echo " $(shuf -n 1 ~/notes/quotes.txt)"
set_color normal
echo


# starship init fish | source



alias cd.='prevd'
alias ccp='g++ -o ./main main.cpp'
alias pow='eval command sudo $history[1]'
alias p='devour mpv'


set -x GDK_BACKEND x11
export PATH="/home/riverside96/.local/bin:$PATH"
export PATH="$PATH:$HOME/.local/share/coursier/bin"


export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

end



thefuck --alias | source
