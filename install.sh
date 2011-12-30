CURR_DIR="`pwd`"

# make backup copy of setting files & dirs
if [ -f $HOME/.vimrc ]; then
    echo "Making backup copy of $HOME/.vimrc -> $HOME/.OLD_vimrc"
    mv "$HOME/.vimrc" "$HOME/.OLD_vimrc"
fi

if [ -f $HOME/.vimrc ]; then
    echo "Making backup copy of $HOME/.gvimrc -> $HOME/.OLD_gvimrc"
    mv "$HOME/.gvimrc" "$HOME/.OLD_gvimrc"
fi

if [ -d $HOME/.vim ]; then
    echo "Making backup copy of $HOME/.vim -> $HOME/.OLD_vim"
    mv "$HOME/.vim" "$HOME/.OLD_vim"
fi

echo "Linking .vimrc, .gvimrc, .vim..."
# make .vimrc + .gvimrc links to vimrc in here
ln -s "$CURR_DIR/vimrc" "$HOME/.vimrc"
ln -s "$CURR_DIR/vimrc" "$HOME/.gvimrc"

# make .vim link to this folder
ln -s "$CURR_DIR" "$HOME/.vim"

# install additional modules etc
echo "Installing addons to VIM"
mkdir bundle

# install pathogen
echo "Installing vim-pathogen..."
git clone git://github.com/tpope/vim-pathogen.git bundle/vim-pathogen

echo "Installing vim-fugitive..."
git clone git://github.com/tpope/vim-fugitive.git bundle/vim-fugitive
