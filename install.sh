#!/bin/bash
# This installation script is intended not to do any harm, but the author makes
# no warranty that it certainly won't.

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
git clone git://github.com/tpope/vim-pathogen.git bundle/vim-pathogen >/dev/null 2>&1

# install fugitive (best GIT support possible)
echo "Installing vim-fugitive..."
git clone git://github.com/tpope/vim-fugitive.git bundle/vim-fugitive >/dev/null 2>&1

# install snipmate, best snippets system ever
echo "Installing snipmate..."
git clone git://github.com/msanders/snipmate.vim.git bundle/snipmate >/dev/null 2>&1

# install surround, most exciting plugin for vim ever :-D
echo "Installing surround..."
git://github.com/tpope/vim-surround.git

# install additional color schemes
echo "Installing colorsamplerpack..."
echo "Check out http://www.vi-improved.org/color_sampler_pack/ to see all schemes"
git://github.com/vim-scripts/Color-Sampler-Pack.git

echo "Installing solarized..."
git://github.com/altercation/vim-colors-solarized.git

# install all other important addons
echo "Installing nerdtree..."
git://github.com/scrooloose/nerdtree.git
echo "Installing command-t..."

echo "Installing nerdcommenter..."
echo "Installing tasklist..."
echo "Installing taglist..."
echo "Installing gundo..."
echo "Installing pyflakes..."
echo "Installing Rope..."
echo "Installing pydoc..."
echo "Installing pytest.vim..."
echo "Installing pep8..."
echo "Installing jinja2 support..."
echo "Installing closetag..."

# install less important addons
echo "Installing LaTeX support..."
echo "Installing ack..."
echo "Installing makegreen..."
echo "Installing nginx syntax..."
