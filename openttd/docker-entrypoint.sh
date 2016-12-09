#!/bin/bash
set -e

if [[ "$1" == '/usr/games/openttd' ]]; then
if [ ! "$(id -u openttd)" -eq "$PUID" ]; then usermod -o -u "$PUID" openttd ; fi
if [ ! "$(id -g openttd)" -eq "$PGID" ]; then groupmod -o -g "$PGID" openttd ; fi

savepath="/home/openttd/.openttd/save"
savegame="${savepath}/${savename}"
LOADGAME_CHECK="${loadgame}"
echo "--------------------"
echo "Running as UID: $uid"
echo "Running as GID: $gid"
echo "--------------------"

# Loads the desired game, or prepare to load it next time server starts up!
if [[ ${LOADGAME_CHECK} == "" ]]; then
	echo "\$loadgame (\"${loadgame}\") not set, starting new game"
	exec gosu openttd /usr/games/openttd -D -x
	exit 0
fi

case ${loadgame} in
	'true')
		if [ -f  ${savegame} ]; then
			echo "Loading savegame ${savegame}"
			exec gosu openttd /usr/games/openttd -D -x -g ${savegame} -d ${DEBUG}
			exit 0
		else
			echo "${savegame} not found..."
			exit 0
		fi
	;;
	'false')
		echo "Creating a new game."
		exec gosu openttd /usr/games/openttd -D -x -d ${DEBUG}
		exit 0
	;;
	'last-autosave')

		savegame=${savepath}/autosave/`ls -rt ${savepath}/autosave/ | tail -n1`

		if [ -r ${savegame} ]; then
			echo "Loading ${savegame}"
			exec gosu openttd /usr/games/openttd -D -x -g ${savegame} -d ${DEBUG}
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
			exec gosu openttd /usr/games/openttd -D -x -g ${savegame} -d ${DEBUG}
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
