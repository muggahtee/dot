if status --is-login
	echo "Login Shell!"
end

function fish_prompt -d "Write out the prompt"
	printf '%s%s%s➤%s ' (set_color $fish_color_cwd) (prompt_pwd) (set_color cyan) (set_color normal)
end

function g -d "alias for git"
	git $argv
end

function gup -d "alias for g up"
	g up $argv
end

function gst -d "alias for g st"
	g st $argv
end

function gap -d "alias for g add -p"
	g add -p $argv
end

function gg -d "alias for gitg"
	gitg $argv
end

function go -d "alias for gnome-open"
	gnome-open $argv
end

function vin -d "alias for vixn"
	vixn $argv
end

function apt -d "alias for aptitude"
	aptitude $argv
end

function todo -d "txt notebook"
	vim ~/Dropbox/TODO.txt
end

function analyse_history -d "analyze fish shell history for often used commands"
	grep -v "^#" $HOME/.config/fish/fish_history | sort | uniq -c | sort -n | tail
end

function LANGC -d "set LANG=C for a single command"
	begin; set -lx LANG C; eval $argv; end
end

set -xg EDITOR vim
set -xg PATH $PATH $HOME/bin $HOME/dev/x10i/x10.dist/bin $HOME/dev/dot/bin
