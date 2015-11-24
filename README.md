mac-os-x-notes
==============

### Mac OS X El Capitan

1. Prepare [a bootable USB disk of El Capitan](https://www.google.com/search?q=bootable+USB+El+Capitan).
2. Hold down the Option key when booting up.
3. Format as `Mac OS Extended, Journaled`.
4. Install the OS and then update.
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
2. Create `~/.vimrc` and add the configuration

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

### Data Analysis Environment

1. `data-analysis`
    1. `cd ~/Applications`
    2. `virtualenv data-analysis`
    3. `cd data-analysis`
    4. `source bin/activate`
    5. `pip install --upgrade pip`
    6. `pip freeze` # then upgrade individual packages
    7. `pip install numpy`
    8. `pip install scipy`
    9. `pip install matplotlib`
    10. `pip install ipython[all]`
    11. `pip install pandas`
    12. `pip install sympy`
2. `data-analysis-3`
    1. `cd ~/Applications`
    2. `pyenv data-analysis-3`
    3. `cd data-analysis-3`
    4. `source bin/activate`
    5. Note at this point, `pip` and `pip3` point to the same binary. Can be verified by comparing `pip --version` and `pip3 --version`. We prefere `pip`
    6. `pip install --upgrade pip`
    7. `pip freeze` # then upgrade individual packages
    8. `pip install numpy`
    9. `pip install scipy`
    10. `pip install matplotlib`
    11. `pip install ipython[all]`
    12. `pip install pandas`
    13. `pip install sympy`

#### AWS Environment (`aws-cli`)

1. `pip3 install awscli`
2. Create `~/.aws/config` and make sure only the user has the access. Add the following:

    ```
    [default]
    region=us-east-1
    aws_access_key_id=<your_aws_access_key_id>
    aws_secret_access_key=<your_aws_secret_access_key>
    
    [profile dev]
    region=us-west-2
    aws_access_key_id=<your_aws_access_key_id>
    aws_secret_access_key=<your_aws_secret_access_key>
    ```

### Java JDK 7

### .bash_profile

This edits `~/.bash_profile`. Besides the lines added by Python, add the following at the beginning:

```bash
    if [ -r "${HOME}/.profile" ]; then
        source "${HOME}/.profile"
    fi
    
    # Make sure /usr/local/bin is before /usr/bin
    PATH="/usr/local/bin:${PATH}"
```
