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
sudo add-apt-repository ppa:jonathonf/vim -y  # ppa for latest vim
sudo apt-get update -y


# git installation
sudo apt install git -y
# install github cli
sudo apt install gh -y
gh auth login    # login, follow prompts

# vim setup
mkdir -p ${SCRIPTPATH}/repos
sudo apt install vim -y
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
sudo apt install ninja-build -y
sudo apt install -y gcc g++

#sudo apt install vim-nox python3-dev -y
#sudo apt install mono-complete golang default-jdk -y
#curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh



# install node
curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
nvm install --lts
#install typescript and its language server
npm install -g typescript-language-server typescript



# install latest llvm too chain
bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
#install clang format
sudo apt install clang-format-15 -y
sudo apt install clangd-15 -y
rm -f /usr/local/bin/clang-format
rm -f /usr/local/bin/clangd
sudo ln -s /usr/bin/clang-format-15 /usr/local/bin/clang-format
sudo ln -s /usr/bin/clangd-15 /usr/local/bin/clangd
mkdir -p ~/localInstall
ln -s ${SCRIPTPATH}/clang-format.py ~/localInstall/
sudo apt install jq -y    #sed like filter for json files, used to concat multuple compile_commands.json file


#install graphviz
sudo apt install graphviz -y



#tree util to list folder tree
sudo apt install -y tree

