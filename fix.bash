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


# fix mappings
rm -f ~/.screenrc
ln -s ${SCRIPTPATH}/dotfiles/.screenrc ~/.
mkdir -p ~/.screendir
chmod 700 ~/.screendir


rm -f ~/.bashrc
ln -s ${SCRIPTPATH}/dotfiles/.bashrc ~/.
rm -f ~/.vim ~/.vimrc
ln -s ${SCRIPTPATH}/repos/vimsetup/vimfiles ~/.vim



