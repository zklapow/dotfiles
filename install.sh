#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc vim zshrc oh-my-zsh"    # list of files/folders to symlink in homedir
bundles="jedi-vim syntastic nerdtree vim-fugitive vim-coffee-script powerline YouCompleteMe"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

for bundle in $bundles; do
    echo "Installing vim bundle $bundle"
    ln -s $dir/$bundle ~/.vim/bundle/$bundle
done

# Build YCM
# Assumes system libclang>=3.3
mkdir -p ~/ycm_build && cd ~/ycm_build && cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON ~/.vim/bundle/YouCompleteMe/cpp && make ycm_core && cd -

# ZSH Theme
echo "Installing custom zsh theme"
ln -s $dir/zklapow.zsh-theme ~/.oh-my-zsh/themes/zklapow.zsh-theme

# Set ZSH as default shell
chsh -s /bin/zsh

# Install python modules
sudo pip install sanetime jedi
