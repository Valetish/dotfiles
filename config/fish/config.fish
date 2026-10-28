if status is-interactive
    # Keep the terminal palette pink-grey even when Caelestia has generated
    # dynamic green/blue terminal escape sequences from the wallpaper.
    printf '\e]10;rgb:e9/e3/e6\e\\'
    printf '\e]11;rgb:17/14/17\e\\'
    printf '\e]12;rgb:e8/a3/b8\e\\'
    printf '\e]17;rgb:e8/a3/b8\e\\'
    printf '\e]4;0;rgb:2b/27/2a\e\\'
    printf '\e]4;1;rgb:d7/7f/9a\e\\'
    printf '\e]4;2;rgb:b8/b2/b6\e\\'
    printf '\e]4;3;rgb:dc/a0/b3\e\\'
    printf '\e]4;4;rgb:8b/85/89\e\\'
    printf '\e]4;5;rgb:e6/a3/ba\e\\'
    printf '\e]4;6;rgb:c5/be/c2\e\\'
    printf '\e]4;7;rgb:e8/e2/e5\e\\'
    printf '\e]4;8;rgb:73/6c/70\e\\'
    printf '\e]4;9;rgb:e9/93/ad\e\\'
    printf '\e]4;10;rgb:cc/c6/ca\e\\'
    printf '\e]4;11;rgb:ea/b5/c5\e\\'
    printf '\e]4;12;rgb:9e/97/9b\e\\'
    printf '\e]4;13;rgb:f0/ae/c3\e\\'
    printf '\e]4;14;rgb:da/d4/d7\e\\'
    printf '\e]4;15;rgb:fb/f8/fa\e\\'

    # Starship custom prompt
    command -v starship &> /dev/null && starship init fish | source

    # Direnv + Zoxide
    command -v direnv &> /dev/null && direnv hook fish | source
    command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source

    # Better ls
    command -v eza &> /dev/null && alias ls='eza --icons --group-directories-first -1'

    # Abbrs
    abbr lg 'lazygit'
    abbr gd 'git diff'
    abbr ga 'git add .'
    abbr gc 'git commit -am'
    abbr gl 'git log'
    abbr gs 'git status'
    abbr gst 'git stash'
    abbr gsp 'git stash pop'
    abbr gp 'git push'
    abbr gpl 'git pull'
    abbr gsw 'git switch'
    abbr gsm 'git switch main'
    abbr gb 'git branch'
    abbr gbd 'git branch -d'
    abbr gco 'git checkout'
    abbr gsh 'git show'

    abbr l 'ls'
    abbr ll 'ls -l'
    abbr la 'ls -a'
    abbr lla 'ls -la'

    # Terminal colours are defined in ~/.config/foot/foot.ini

    # For jumping between prompts in foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end

    # Custom fish config
    set -q XDG_CONFIG_HOME && set -l cConf $XDG_CONFIG_HOME/caelestia || set -l cConf $HOME/.config/caelestia
    source $cConf/user-config.fish 2> /dev/null
end
