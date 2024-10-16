if command -v eza > /dev/null
	abbr -a l "eza"
	abbr -a ls "eza"
	abbr -a ll "eza -l"
	abbr -a lll "eza -la"
else
	abbr -a l "ls"
	abbr -a ll "ls -l"
	abbr -a lll "ls -la"
end
abbr -a vim "nvim"

set SDKMAN_DIR $HOME/.sdkman
set GOPATH $HOME/.config/go 
    
if status is-interactive
   # Commands to run in interactive sessions can go here
   fish_add_path $HOME/.config/emacs/bin
   fish_add_path $HOME/.local/share/coursier/bin
   fish_add_path $HOME/.local/bin
   fish_add_path $HOME/.cargo/env
   fish_add_path /usr/local/go/bin
   fish_add_path $GOPATH/bin
   fish_add_path (find $HOME/.sdkman/candidates/*/current/bin -maxdepth 0)

   if not contains $HOME/.ghcup/bin $PATH
        fish_add_path $HOME/.ghcup/bin
   end
   if not contains $HOME/.cabal/bin $PATH
        fish_add_path $HOME/.cabal/bin
   end
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/stanic/miniforge3/bin/conda
    eval /home/stanic/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/stanic/miniforge3/etc/fish/conf.d/conda.fish"
        . "/home/stanic/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/stanic/miniforge3/bin" $PATH
    end
end
# <<< conda initialize <<<

function sdk
    bash -c "source '$HOME/.sdkman/bin/sdkman-init.sh'; sdk $argv[1..]"
end

function vterm_printf;
    if begin; [  -n "$TMUX" ]  ; and  string match -q -r "screen|tmux" "$TERM"; end
        # tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$argv"
    else if string match -q -- "screen*" "$TERM"
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$argv"
    else
        printf "\e]%s\e\\" "$argv"
    end
end

starship init fish | source

neofetch
