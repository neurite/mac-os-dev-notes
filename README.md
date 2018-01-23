mac-os-x-notes
==============

### Mac OS X El Capitan

1. Prepare [a bootable USB disk of El Capitan](https://www.google.com/search?q=bootable+USB+El+Capitan).
2. Hold down the Option key when booting up.
3. Install the OS and then update. Note format the partition as `Mac OS Extended, Journaled`.
4. Customize:
    1. System Preferences... --> Tackpad
    2. System Preferences... --> Desktop
    3. System Preferences... --> Dock
    4. System Preferences... --> Security & Privacy --> General --> Require password immediately
    5. System Preferences... --> Security & Privacy --> General --> Advanced --> Logout, Require admin password
    6. System Preferences... --> Security & Privacy --> FileVault, Firewall
    7. Finder --> Preferences...
    8. Safari
    9. Chrome
5. Install:
    1. Xcode Command-Line Tools
    2. VirtualBox
    3. Docker Custom Install (TODO: The docker install)
        1. Docker Client
        2. Docker Machine
        3. Docker Compose
    4. Anonymous Pro, Cousine, Droid Sans, Droid Sans Mono, Source Code Pro from [Font Squirrel](http://www.fontsquirrel.com/fonts/list/classification/monospaced)
    5. Text editors: [Atom](https://atom.io/), [Visual Studio Code](https://code.visualstudio.com/). Note both can run locally from `~/Applications`.

### Startup Modes

When powering up

* Hold down Command-R for recovery mode.
* Hold down Command-S for single-user mode.
* Hold down Command-V for verbose mode.

To disable single-user mode, enter the recovery mode and set a firmware password. *Make sure to never forget the firmware password.*

### vim

1. Make sure the Xcode Command-Line Tools are installed
2. Check the current vim version `vim --version`. The target is to add Python 3 support "+python3"
3. Note that the conda python is not compatible with the vim build. Remove it temporarilty from '.bashrc'. Make sure that `python3` points to the system python
4. `git clone https://github.com/vim/vim.git`
5. `cd vim`
6. `./configure --enable-python3interp --disable-netbeans`
7. `make`
8. Copy `src/vim` to `~/Applications/vim/bin`
9. Add it to `$PATH` in `~/.bashrc`. Remember to uncomment the miniconda python in `~/.bashrc`
10. Make a directory `sudo mkdir /usr/local/share/vim`
11. Copy everything system vim there `sudo cp -r /usr/share/vim/vim73/* /usr/local/share/vim/`
12. May also need the file `rgb.txt` in `/usr/local/share/vim/`. The file can be found online

### Java

1. Download and install [Oracle Java JDK](https://www.oracle.com/technetwork/java/javase/downloads/). Java virtual machines are installed at `/Library/Java/JavaVirtualMachines`.

  ```bash
  $ls -l /Library/Java/JavaVirtualMachines
  drwxr-xr-x  3 root  wheel  102 Jul 14 14:52 1.6.0.jdk
  drwxr-xr-x  3 root  wheel  102 Jan  4 16:06 jdk1.8.0_66.jdk
  ```

2. Before Mac OS X 10.7 Lion, Java is also set up at `/System/Library/Frameworks/JavaVM.framework`. Let's call this framework Java. If Java 6 is installed using [the Apple package](https://support.apple.com/kb/DL1572), it is still installed as framework Java, at `/System/Library/Frameworks/JavaVM.framework`. This is for legacy Java 6 only. Newer versions of Java, Java 7 and 8, are from Oracle and are not at system frameworks any more.
3. `/usr/libexec/java_home` is where the Java home is read. For example,

  ```bash
  $/usr/libexec/java_home         # the default Java home
  /Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home
  $/usr/libexec/java_home -v 1.8  # Java 8 home
  /Library/Java/JavaVirtualMachines/jdk1.8.0_66.jdk/Contents/Home
  $/usr/libexec/java_home -v 1.6  # Java 6 home
  /Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
  $/usr/libexec/java_home -V      # List of installed JVMs
  ```

4. Set up JAVA_HOME for the terminal. Certain apps at command-line need the JAVA_HOME environment variable.

  ```bash
  export JAVA_HOME="$(/usr/libexec/java_home)"
  export PATH="${PATH}:${JAVA_HOME}/bin"
  ```

5. Download and install Eclipse.

### Python

1. OS Python (or let conda manages Python for you)
    1. ActiveTcl 8.5.18.0 (See [IDLE and tkinter with Tcl/Tk on Mac OS X](https://www.python.org/download/mac/tcltk/)).
    2. Python 2.7.14 (includes pip). The commands to run are `python` and `pip` respectively.
    3. Python 3.6.3 (includes pip3). The commands to run are `python3` and `pip3` respectively.
2. Conda (recommended over the OS Python)
    1. Environments
        1. `conda create --name snowflakes` or `conda create --name snowflakes3 python=3`
        2. `source activate snowflakes` and `source deactivate`
        3. `conda env list`
        4. `conda create --name flowers --clone snowflakes`
        5. `conda remove --name flowers --all`
        6. `conda env export > snowflakes.yml` (which include a section of pip dependencies)
        7. `conda env create -f snowflakes.yml`
    2. Packages
        1. `conda list`
        2. `conda search beautiful-soup`
        3. `conda install -c anaconda bottleneck` (install from a specific channel)
        4. `pip install see` (run pip inside the activated environment)
    3. Updates
        1. `conda update --all`
        2. `conda update conda`
3. Python machine learning stack
    1. `pandas`, `sqlite`: data i/o, munging
    2. `numpy`, `scipy`, `scikit-learn`: computation, machine learning
    3. `matplotlib`, `seaborn`: visualization
4. Specialties
    1. `scikit-image`: image analysis
    2. `gensim`: semantic analysis, topics
    3. `beautifulsoup4`: web page scraping
    4. `scrapy`: web crawling

### Terminal

By default the Mac OS terminal is a login shell (`/usr/bin/login`). The login shell executes `~/.bash_profile`. Note that it does not execute `~/.bashrc`. We either use `~/.bash_profile` directly or `source ~/.bashrc` in `~/.bash_profile`. We can also make the terminal a non-login shell (`/bin/bash`).

Visual profile:

* Background: opacity 85%, blur 0%
* Font: Source Code Pro 18 pt
* Text: Antialias

