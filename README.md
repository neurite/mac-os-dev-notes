mac-os-x-notes
==============

### Mac OS X Mavericks

1. `Command + R`, then power on
2. Disk Utility. Mac OS Extended, Journaled
3. Install the OS
4. Software updates
5. Customize
    1. Touch pad
    2. Wall paper
    3. Dock
    4. Finder
    5. Safari
6. Firefox
7. Xcode Command-Line Tools
8. VirtualBox
9. Vagrant

### Terminal

1. Cousine, Droid Sans, Droid Sans Mono from Font Squirrel
2. Create `~/.vimrc` and add the configuration

    ```
    syntax on
    set background=dark
    filetype plugin indent on
    set showcmd
    set showmatch
    set ignorecase
    set smartcase
    set incsearch
    set autowrite
    set hidden
    set mouse=a
    set number
    set ruler
    ```

### Python

1. ActiveTcl 8.5.16.0
2. Python 2.7.8
3. Python 3.4.2
4. pip (Python 2 only)
    1. Note `pip3` comes with Python 3. The steps below are for Python 2
    2. `curl -O https://bootstrap.pypa.io/get-pip.py`
    3. `sudo python get-pip.py`
    4. `rm get-pip.py`
    5. pip usage
        1. `sudo pip install <pkg>`
        2. `sudo pip install -U <pkg>`
    6. pip maintenance
        1. `sudo pip install -U pip`
        2. `sudo pip freeze`
        3. `sudo pip install -U <pkg>`
5. virtualenv (Python 2 only)
    1. Note `pyvenv` comes with Python 3. The steps below are for Python 2
    2. `sudo pip install virtualenv`
    3. In the directory `~/Applications`:
        1. `virtualenv <env-name>`
        2. `source <env>/bin/activate`
        3. Then can go anywhere and do work. When done, `deactivate`

### Data Analysis Environment

1. `data-analysis`
    1. `cd ~/Applications`
    2. `virtualenv data-analysis`
    3. `cd data-analysis`
    4. `source bin/activate`
    5. `pip install numpy`
    6. `pip install scipy`
    7. `pip install matplotlib`
    8. `pip install ipython[all]`
    9. `pip install pandas`
    10. `pip install sympy`
2. `data-analysis-3`
    1. `cd ~/Applications`
    2. `pyvenv data-analysis-3`
    3. `cd data-analysis-3`
    4. `source bin/activate`
    5. `pip3 install numpy`
    6. `pip3 install scipy`
    7. `pip3 install matplotlib`
    8. `pip3 install ipython[all]`
    9. `pip3 install pandas`
    10. `pip3 install sympy`

### Java JDK 7

### `~/.bash_profile`

Besides the lines added by Python, add the following at the beginning:

    ```
    source ~/.profile
    # Make sure /usr/local/bin is before /usr/bin
    PATH="/usr/local/bin:${PATH}"
    ```
