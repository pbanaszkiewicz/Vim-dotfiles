About
-----

This vim settings repository contains:

* some predefined, well-formatted vim settings
* settings for useful vim scripts + information about key bindings
* easy install && update scripts to handle pathogen's bundles

Installation
------------

Clone this repository anywhere, for example to your HOME dir:

    git clone https://github.com/pbnan/Vim-dotfiles.git $HOME/vimconfig

Then run `install.sh` from within `$HOME/vimconfig` directory.

If you are going to display functions, variables, classes, class methods and
so on, you ougth to install `ctags` package for your distribution.

You *don't need to install* `pyflakes` package, as one is included with
`python-mode` vim addon. This is also virtualenv-safe, so don't worry about it.

After installation
------------------

Please make sure you read the whole `vimrc` file. It contains not only
predefined by me settings, but also links to useful resources (where you can
learn how to use for example `surround` plugin) and even more useful
keybindings.

You can change your font and/or theme as desired, too.

Please note that this configuration is intended mainly to help working on
Python files and there might exist more sufficient configurations for other
languages.

Updating
--------

First make sure you're using latest vim configs from this repository:

    git pull origin

Then simply run:

    ./update.sh

Future
------

Make managing vim scripts easier.
