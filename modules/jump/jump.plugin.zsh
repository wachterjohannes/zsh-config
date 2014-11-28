# Easily jump around the file system by manually adding marks
# marks are stored as symbolic links in the directory $MARKPATH (default $HOME/.marks)
#
# jump FOO: jump to a mark named FOO
# mark FOO: create a mark named FOO
# unmark FOO: delete a mark
# marks: lists all marks
#
export MARKPATH=$HOME/.marks

jump() {
	cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}

mark() {
	if (( $# == 0 )); then
		MARK=$(basename "$PWD")
	else
		MARK="$1"
	fi
	if read -q \?"Mark $PWD as ${MARK}? (y/n) "; then
		mkdir -p "$MARKPATH"; ln -s "$PWD" "$MARKPATH/$MARK"
	fi
}

unmark() {
	rm -i "$MARKPATH/$1"
}

autoload colors
marks() {
	for link in $(ls $MARKPATH | awk '{print $1}'); do
		local markname="$fg[cyan]${link:t}$reset_color"
		local markpath="$fg[blue]$(readlink $MARKPATH/$link)$reset_color"
		printf "%s\t" $markname
		printf "-> %s \t\n" $markpath
	done
}

_completemarks() {
	compadd $(ls $MARKPATH | awk '{print $1}')
}
compdef _completemarks jump
compdef _completemarks unmark
