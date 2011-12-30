About
-----

This vim settings repository contains:

* some predefined, well-formatted vim settings
* settings for useful vim scripts + information about key bindings
* easy install && update scripts to handle pathogen's bundles

Installation
------------

Clone this repository to your HOME dir, e.g.:

    git clone https://github.com/pbnan/Vim-dotfiles.git $HOME/vimconfig

Then run `install.sh` from within `$HOME/vimconfig` directory.

If you are going to use Python syntax checking on-the-fly, you ougth to
install Python package `pyflakes`:http://pypi.python.org/pypi/pyflakes

If you are going to display functions, variables, classes, class methods and
so on, you ougth to install `ctags` application.

Updating
--------

First make sure you're using latest vim configs from this repository:

    git pull origin

Then simply run:

    ./update.sh
