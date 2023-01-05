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

# fix bashrc
rm -f ~/.bashrc
ln -s ${SCRIPTPATH}/dotfiles/.bashrc ~/.
touch ~/.manishbashrc
echo "Add custom setting to ~/.manishbashrc"

#fix screenrc
rm -f ~/.screenrc
ln -s ${SCRIPTPATH}/dotfiles/.screenrc ~/.
mkdir -p ~/.screendir
chmod 700 ~/.screendir


sudo apt-get update -y
sudo add-apt-repository ppa:git-core/ppa -y   # apt-repo for git-latest
sudo apt-get update -y


# git installation
sudo apt install git -y
# install github cli
sudo apt install gh -y
gh auth login    # login, follow prompts

# vim setup
mkdir -p ${SCRIPTPATH}/repos
gh repo clone magoel/vimsetup ${SCRIPTPATH}/repos/vimsetup
rm -f ~/.vim 
rm -f ~/.vimrc
mkdir -p ~/vim-swap
ln -s ${SCRIPTPATH}/repos/vimsetup/vimfiles ~/.vim
mkdir -p ~/.vim/bundle

#install vim plugins 
gh repo clone VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
vim -c ":PluginInstall" -c ":qa!"



sudo apt-get install build-essential -y
sudo apt-get install gdb -y
sudo apt-get install global -y
sudo apt install exuberant-ctags -y
sudo apt install vim-gtk -y    # needed for clipboard support
sudo apt install cmake -y

#sudo apt install vim-nox python3-dev -y
#sudo apt install mono-complete golang default-jdk -y
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh



# install node
curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
nvm install --lts
