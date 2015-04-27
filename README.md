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

1. ActiveTcl 8.5.17.0 (See [IDLE and tkinter with Tcl/Tk on Mac OS X](https://www.python.org/download/mac/tcltk/))
2. Python 2.7.9 or the latest
3. Python 3.4.3 or the latest
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
    1. Note `pyenv` comes with Python 3. The steps below are for Python 2
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
    5. Note at this point, `pip` and `pip3` point to the same binary. Can be verified via `pip --version` and `pip3 --version`. We prefere `pip`
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
