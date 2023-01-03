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


# fix mappings
rm -f ~/.vim
ln -s ${SCRIPTPATH}/repos/vimsetup/vimfiles ~/.vim



#update
${SCRIPTPATH}/update.bash
