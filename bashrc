#
# ~/.bashrc
#

[[ $- != *i* ]] && return

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[[ -f ~/.bashrc_aliases ]] && . ~/.bashrc_aliases

# Define some colors first:
red='\e[0;31m'
RED='\e[1;31m'
blue='\e[0;34m'
BLUE='\e[1;34m'
cyan='\e[0;36m'
CYAN='\e[1;36m'
NC='\e[0m' # No Color

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

# Find a file with a pattern in name:
function ff()
{ find . -type f -iname '*'$*'*' -ls ; }
# Find a file with pattern $1 in name and Execute $2 on it:

function ii()   # get current host related info
{
  echo -e "\nYou are logged on ${RED}$HOST"
  echo -e "\nAdditionnal information:$NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current date :$NC " ; date
  echo -e "\n${RED}Machine stats :$NC " ; uptime
  echo -e "\n${RED}Memory stats :$NC " ; free
  my_ip 2>&- ;
  echo -e "\n${RED}Local IP Address :$NC" ; echo ${MY_IP:-"Not connected"}
  echo -e "\n${RED}ISP Address :$NC" ; echo ${MY_ISP:-"Not connected"}
  echo
}

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

if [ $(id -u) -eq 0 ];
then
  PS1='\[\e[1;31m\][\u@\h \w]\$\[\e[m\] '
else
  PS1='\[\e[1;33m\][\u@\h \w]\$\[\e[m\] '
fi
