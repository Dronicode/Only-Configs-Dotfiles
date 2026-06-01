if [[ -z "${ZDOTDIR:-}" || "$ZDOTDIR" == "$HOME" ]]; then
	export ZDOTDIR="$HOME/.config/zsh"
fi