mac-os-x-notes
==============

### Mac OS X El Capitan

1. Prepare [a bootable USB disk of El Capitan](https://www.google.com/search?q=bootable+USB+El+Capitan).
2. Hold down the Option key when booting up.
3. Install the OS and then update. Note format the partition as `Mac OS Extended, Journaled`.
5. Customize:
    1. System Preferences... --> Tackpad
    2. System Preferences... --> Desktop
    3. System Preferences... --> Dock
    4. Finder --> Preferences...
    5. Safari
    6. Chrome
6. Install:
    1. Xcode Command-Line Tools
    2. VirtualBox
    3. Vagrant
    4. Docker Custom Install
        1. Docker Client
        2. Docker Machine
        3. Docker Compose

### Terminal

1. Source Code Pro, Cousine, Droid Sans, Droid Sans Mono from Font Squirrel
2. By default the Mac OS terminal is a login shell (`/usr/bin/login`). The login shell executes `~/.bash_profile`. Note that it does not execute `~/.bashrc`. We can make it a non-login shell (`/bin/bash`). No matter what shell we choose, to be consistent edit, `~/.bash_profile` so that it looks like this:
    
    ```bash
    if [ -r ~/.profile ]; then
        . ~/.profile;
    fi
    
    # More ~/.bash_profile script goes here
    
    if [ -r ~/.bashrc ]; then
        . ~/.bashrc;
    fi
    ```
    
    Then add the following in `~/.bashrc`:
    
    ```bash
    # Make sure /usr/local/bin is before /usr/bin
    PATH="/usr/local/bin:${PATH}"
    ```

3. Create `~/.vimrc` and add the configuration

    ```bash
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
    set tabstop=4
    set shiftwidth=4
    set expandtab
    ```

### Python

1. ActiveTcl 8.5.18.0 (See [IDLE and tkinter with Tcl/Tk on Mac OS X](https://www.python.org/download/mac/tcltk/))
2. Python 2.7.10 (includes pip). The commands to run are `python` and `pip` respectively.
3. Python 3.5.0 (includes pip3). The commands to run are `python3` and `pip3` respectively.
4. pip
    1. `sudo -H pip install --upgrade pip`
    2. `sudo -H pip list` and then upgrade each package
5. virtualenv
    1. `sudo -H pip install virtualenv`
    2. In the directory `~/Applications`:
        1. `virtualenv <env-name>`
        2. `source <env>/bin/activate`
        3. Then can go anywhere and do work. When done, `deactivate`
    3. `virtualenv --python=python2.7 <env-name>`. Note the default is the interpreter that virtualenv was installed with. In my case `which virtualenv` shows it is with python 3.5.
    4. `pip freeze > requirements.txt` and `pip install -r requirements.txt`.

### Python Environments

1. [The SciPy Stack](http://www.scipy.org/)
    1. `cd ~/Applications`
    2. `virtualenv scipy`
    3. `cd scipy`
    4. `source bin/activate`
    5. `pip install --upgrade pip`
    6. `pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U` # upgrade existing packages
    7. `pip install gnureadline` # for command line editing, tab completion, etc. replaces libedit
    8. `pip install nose`
    9. `pip install pyzmq pygments`
    10. `pip install ipython[all]`
    11. `pip install numpy`
    12. `pip install scipy`
    13. `pip install matplotlib`
    14. `pip install pandas`
    15. `pip install sympy`
    16. `pip freeze > requirements.txt`

2. [scikit-learn](http://scikit-learn.org/)
    1. `cd ~/Applications`
    2. `virtualenv scikit-learn`
    3. `cd scikit-learn`
    4. `source bin/activate`
    5. `pip install --upgrade pip`
    6. `cp ~/Applications/scipy/requirements.txt ./` # copy requirements.txt dumped by th scipy env
    7. `pip install -r requirements.txt`
    8. `pip install scikit-learn`

3. [AWS Command Line](https://aws.amazon.com/cli/)
    1. `cd ~/Applications`
    2. `virtualenv aws`
    3. `cd scipy`
    4. `source bin/activate`
    5. `pip install --upgrade pip`
    6. `pip freeze` # then upgrade individual packages
    7. `pip install awscli`
    8. Create `~/.aws/config` and make sure only the user has the access. Add the following:

        ```
        [default]
        region=us-west-2
        aws_access_key_id=<your_aws_access_key_id>
        aws_secret_access_key=<your_aws_secret_access_key>
        
        [profile prod]
        region=us-west-2
        aws_access_key_id=<your_aws_access_key_id>
        aws_secret_access_key=<your_aws_secret_access_key>
        ```

### Java JDK
