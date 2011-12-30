#!/bin/bash
# DISCLAIMER:
# This installation script is intended not to do any harm, but the author makes
# no warranty that it certainly won't and/or perfectly fits your needs.

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
git clone git://github.com/tpope/vim-surround.git bundle/surround >/dev/null 2>&1

# install additional color schemes
echo "Installing colorsamplerpack..."
echo "Check out http://www.vi-improved.org/color_sampler_pack/ to see all schemes"
git clone git://github.com/vim-scripts/Color-Sampler-Pack.git bundle/colorsamplerpack >/dev/null 2>&1

echo "Installing solarized..."
git clone git://github.com/altercation/vim-colors-solarized.git bundle/solarized >/dev/null 2>&1

# install all other important addons
echo "Installing nerdtree..."
git clone git://github.com/scrooloose/nerdtree.git bundle/nerdtree >/dev/null 2>&1
echo "Installing command-t..."
# simpler repository
git clone git://github.com/vim-scripts/Command-T.git bundle/command-t >/dev/null 2>&1
echo "Installing nerdcommenter..."
git clone git://github.com/scrooloose/nerdcommenter.git bundle/nerdcommenter >/dev/null 2>&1
echo "Installing tasklist..."
git clone git://github.com/vim-scripts/TaskList.vim.git bundle/tasklist >/dev/null 2>&1
echo "Installing taglist..."
echo "NOTE: you need to install ctags in order to use taglist"
git clone git://github.com/vim-scripts/taglist.vim.git bundle/taglist >/dev/null 2>&1
echo "Installing gundo..."
git clone git://github.com/sjl/gundo.vim.git bundle/gundo >/dev/null 2>&1
echo "Installing pyflakes..."
echo "NOTE: you need to install pyflakes package for your Python2.x installation"
git clone git://github.com/kevinw/pyflakes-vim.git bundle/pyflakes-vim >/dev/null 2>&1
echo "Installing Rope..."
# TODO: in future, take a look at https://github.com/klen/python-mode
echo "For future reference: https://github.com/klen/python-mode"
git clone git://github.com/klen/rope-vim.git bundle/ropevim >/dev/null 2>&1
echo "Installing pydoc..."
git clone git://github.com/fs111/pydoc.vim.git bundle/pydoc >/dev/null 2>&1
echo "Installing pytest.vim..."
git clone git://github.com/alfredodeza/pytest.vim.git bundle/pytest >/dev/null 2>&1
echo "Installing pep8..."
git clone git://github.com/jcrocholl/pep8.git bundle/pep8 >/dev/null 2>&1
echo "Installing jinja2 support..."
git clone git://github.com/vim-scripts/Jinja.git bundle/jinja >/dev/null 2>&1
echo "Installing closetag..."
git clone git://github.com/vim-scripts/closetag.vim.git bundle/closetag >/dev/null 2>&1
echo "Installing delimitMate (for autoclosing brackets etc)..."
git clone git://github.com/Raimondi/delimitMate.git bundle/delimitMate >/dev/null 2>&1

# install less important addons
echo "Installing LaTeX support..."
git clone git://github.com/gerw/vim-latex-suite.git bundle/latex >/dev/null 2>&1
echo "Installing ack..."
git clone git://github.com/vim-scripts/ack.vim.git bundle/ack >/dev/null 2>&1
echo "Installing makegreen..."
git clone git://github.com/reinh/vim-makegreen.git bundle/makegreen >/dev/null 2>&1
echo "Installing nginx syntax..."
git clone git://github.com/vim-scripts/nginx.vim.git bundle/nginx >/dev/null 2>&1
