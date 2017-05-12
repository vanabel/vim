# Introduction
This is my vim settings on windows 7, 64bit with vim8.0 64bit. It is a backup and can be easily recovered. It is mainly configured for scientific writing with the help of [lervag/vimtex](https://github.com/lervag/vimtex) plugin. It has the following features:

* Good formatted \_vimrc file
* The plugins is managed by [junegunn/vim-plug](https://github.com/junegunn/vim-plug)
* Support color themes:solarized/molokai/phd
* Use [Ultisnips](https://github.com/SirVer/ultisnips) to do quick input of TeX
* Use [FastFold](https://github.com/Konfekt/FastFold) to support fold of TeX
* Use [vim-session](https://github.com/xolox/vim-session) to save work status
* Use [vim-shell](https://github.com/xolox/vim-shell) to toggle full-screen
* Add more quick math input by `vimtex#imaps#add_map`
* Support `XeLaTeX` compile (default)
* Support real-time preview: It will make use of `latexmk` to compile background
* Support forward/backward search (Switch between PDF/TeX source)

# Installation

To make it work, you need to install the following vim plugin or applications. I will list it one by one.

## Pre-Install

To make the installation work, we need some other applications, which is list below.

### Install vim and texlive

First of first of course we need to install [Vim](http://www.vim.org/download.php) and [texlive](https://www.tug.org/texlive/), the configuration is only make vim works more perfect when we write TeX document.

I should remark that vim provides an 64 bit version also, which can be found [here](https://github.com/vim/vim-win32-installer/releases/tag/v8.0.0003). 

I also recommend to install `texlive` instead of other TeX system (e.g., MikTeX), since it works on all platforms and it more stable. By the way, you can **Uncheck the documents and source files** in the installation to reduce the total space (its about 2.15GB on my windows, I install all packages).

### Install plugin admin `vim-plug`

You can drop the `plug.vim` (under `myvim/downloads/plug.vim`) to `Vim8/vim80/autoload`. For new version or more information on how to install `vim-plug`, we refer to the plugin github host: [vim-plug](https://github.com/junegunn/vim-plug)

### Install `git`

Since `vim-plug` is work by install vim plugins through git, we need to install it first. Just have a look at [Downloading Git](https://git-scm.com/download/win)

### Install `python`

Since [UltiSnip](https://github.com/SirVer/ultisnips) need `python2` or `python3`, we need to install it. But note that: __Choose the right version__

* If you install vim 32 bit version on your 64 bit windows, then you should choose 32 bit python
* The newest version is not the best, you should check the required version by: run `:version` in vim, you will see `python27.dll` or `python35.dll`, thus we either install **Python 2.7** or **Python 3.5**, all the version can be found at [Download Python](https://www.python.org/downloads/)

## Install the Plugin

Now, we are at the point of install the vim plugin, believe me, it is quite easy after the long preparation.

### Clone the settings

We need first download the setting from github to your local vim installation directory (e.g. `D:\Vim8`), this can be done by (Please backup your local `_vimrc` first):

```bash
cd /D D:\Vim8
git clone https://github.com/vanabel/vim.git
```

You can check that the directory looks like:

```
Vim8
├── Vim8/_gvimrc
├── Vim8/_vimrc
├── Vim8/LICENSE
├── Vim8/myvim
├── Vim8/README.md
├── Vim8/vim80
└── Vim8/vimfiles
```

### Install the vim plugins

Now stat vim (there maybe some warnings or errors, since some plugin is not installed, which can be removed by check the plugin is installed or not first) and input `:PlugInstall`, all plugin will installed automatically.

## Things to do after this

I recommend to have a check of the file `_vimrc` and `_gvimrc` since it contains a lot of configurations, which I will not explain it here. After that, just enjoy the speed of input TeX.

# License

MIT License

Copyright (c) 2017 vanabel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
