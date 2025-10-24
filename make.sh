#!/bin/sh

[ command -v pdflatex 2>/dev/null ] || {
	printf "no pdflatex...\n";
	exit 1;
}

flatex() {
	printf "do you want to build the LaTeX document form source? (y/n)\n"
	read X
	case "${X}" in
		[y]*)
			printf "building LaTeX from source...\n"
			pdflatex latex.tex || return 8
			cp latex.pdf "${HOME}" || return 16
			;;
		[n]*)
			printf "you chose NOT to build LaTeX from source...\n"
			;;
		*)
			printf "invalid response...\n"
			printf "(yes/no)\n"
			;;
	esac
}

{ flatex; RET="${?}"; } || exit 1

[ "${RET}" -eq 0 ] 2>/dev/null || printf "%s\n" "${RET}"
