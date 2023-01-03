#!/bin/bash
pushd . > /dev/null
SCRIPTPATH="${BASH_SOURCE[0]}";
while([ -h "${SCRIPTPATH}" ]); do
	cd "`dirname "${SCRIPTPATH}"`"
	SCRIPTPATH="$(readlink "`basename "${SCRIPTPATH}"`")";
done
cd "`dirname "${SCRIPTPATH}"`" > /dev/null
SCRIPTPATH="`pwd`";
popd  > /dev/null


sudo apt-get update -y

gh auth login    # login git hub, follow prompts



# vim repo update
pushd ${SCRIPTPATH}/repos/vimsetup
git pull
popd
#update vim plugins 
vim -E -s << EOF
:PluginUpdate
:quit
EOF
