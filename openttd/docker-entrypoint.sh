#!/bin/bash
set -e

if [[ "$1" == '/usr/games/openttd' ]]; then
uid=${PUID:-999}
gid=${PGID:-999}
savepath="/home/openttd/.openttd/save"
savegame="${savepath}/${savename}"
LOADGAME_CHECK="${loadgame}"

# Loads the desired game, or prepare to load it next time server starts up!
if [[ ${LOADGAME_CHECK} == "" ]]; then
	echo "\$loadgame (\"${loadgame}\") not set, starting new game"
	exec gosu $uid:$gid /usr/games/openttd -D
	exit 0
fi

case ${loadgame} in
	'true')
		if [ -f  ${savegame} ]; then
			echo "Loading savegame ${savegame}"
			exec gosu $uid:$gid /usr/games/openttd -D -g ${savegame} -d ${DEBUG}
			exit 0
		else
			echo "${savegame} not found..."
			exit 0
		fi
	;;
	'false')
		echo "Creating a new game."
		exec gosu $uid:$gid /usr/games/openttd -D -d ${DEBUG}
		exit 0
	;;
	'last-autosave')

		savegame=${savepath}/autosave/`ls -rt ${savepath}/autosave/ | tail -n1`

		if [ -r ${savegame} ]; then
			echo "Loading ${savegame}"
			exec gosu $uid:$gid /usr/games/openttd -D -g ${savegame} -d ${DEBUG}
			exit 0
		else
			echo "${savegame} not found..."
			exit 1
		fi
	;;
	'exit')

		savegame="${savepath}/autosave/exit.sav"

		if [ -r ${savegame} ]; then
			echo "Loading ${savegame}"
			exec gosu $uid:$gid /usr/games/openttd -D -g ${savegame} -d ${DEBUG}
			exit 0
		else
			echo "${savegame} not found..."
			exit 1
		fi
	;;
	*)
		echo "ambigous loadgame (\"${loadgame}\") statement inserted."
		exit 1
	;;
esac
else
	exec "$@"

fi
