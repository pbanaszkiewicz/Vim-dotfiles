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
git://github.com/tpope/vim-surround.git bundle/surround

# install additional color schemes
echo "Installing colorsamplerpack..."
echo "Check out http://www.vi-improved.org/color_sampler_pack/ to see all schemes"
git://github.com/vim-scripts/Color-Sampler-Pack.git bundle/colorsamplerpack

echo "Installing solarized..."
git://github.com/altercation/vim-colors-solarized.git bundle/solarized

# install all other important addons
echo "Installing nerdtree..."
git://github.com/scrooloose/nerdtree.git bundle/nerdtree
echo "Installing command-t..."
# simpler repository
git://github.com/vim-scripts/Command-T.git bundle/command-t
echo "Installing nerdcommenter..."
git://github.com/scrooloose/nerdcommenter.git bundle/nerdcommenter
echo "Installing tasklist..."
git://github.com/vim-scripts/TaskList.vim.git bundle/tasklist
echo "Installing taglist..."
echo "NOTE: you need to install ctags in order to use taglist"
git://github.com/vim-scripts/taglist.vim.git bundle/taglist
echo "Installing gundo..."
git://github.com/sjl/gundo.vim.git bundle/gundo
echo "Installing pyflakes..."
git://github.com/kevinw/pyflakes-vim.git bundle/pyflakes-vim
echo "Installing Rope..."
# TODO: in future, take a look at https://github.com/klen/python-mode
git://github.com/klen/rope-vim.git bundle/ropevim
echo "Installing pydoc..."
git://github.com/fs111/pydoc.vim.git bundle/pydoc
echo "Installing pytest.vim..."
git://github.com/alfredodeza/pytest.vim.git bundle/pytest
echo "Installing pep8..."
git://github.com/jcrocholl/pep8.git bundle/pep8
echo "Installing jinja2 support..."
git://github.com/vim-scripts/Jinja.git bundle/jinja
echo "Installing closetag..."
git://github.com/vim-scripts/closetag.vim.git bundle/closetag

# install less important addons
echo "Installing LaTeX support..."
git://github.com/gerw/vim-latex-suite.git bundle/latex
echo "Installing ack..."
git://github.com/vim-scripts/ack.vim.git bundle/ack
echo "Installing makegreen..."
git://github.com/reinh/vim-makegreen.git bundle/makegreen
echo "Installing nginx syntax..."
git://github.com/vim-scripts/nginx.vim.git bundle/nginx
