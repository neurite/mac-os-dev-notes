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
    3. Anonymous Pro, Cousine, Droid Sans, Droid Sans Mono, Source Code Pro from [Font Squirrel](http://www.fontsquirrel.com/fonts/list/classification/monospaced)
    4. [Miniconda](https://conda.io/miniconda.html)
    5. [Atom](https://atom.io/), the unzipped app can run locally from `~/Applications`
    6. [PyCharm CE](https://www.jetbrains.com/pycharm/)
    7. [Visual Studio Code](https://code.visualstudio.com/), can run locally from `~/Applications`

### Startup Modes

When powering up

* Hold down Command-R for recovery mode.
* Hold down Command-S for single-user mode.
* Hold down Command-V for verbose mode.

To disable single-user mode, enter the recovery mode. In the "macOS Utilities" window, choose "Utilities" then "Startup Security Utility", and set a firmware password. *Make sure to never forget the firmware password.*

### Terminal

By default the Mac OS terminal is a login shell (`/usr/bin/login`). The login shell executes `~/.bash_profile`. Note that it does not execute `~/.bashrc`. We either use `~/.bash_profile` directly or `source ~/.bashrc` in `~/.bash_profile`. We can also make the terminal a non-login shell (`/bin/bash`).

Visual profile:

* Background: opacity 85%, blur 0%
* Font: Source Code Pro 18 pt
* Text: Antialias

### vim

Run `vim --version` should see "-python3", the target is to add Python 3 support "+python3".

Befroe we proceed, make sure the Xcode Command-Line Tools are installed.

The source code of `vim` is checked out into `~/Downloads` and is compiled there. The compiled code is deployed to `~/Applications`. Here are the steps:

1. `cd ~/Downloads`
2. `git clone https://github.com/vim/vim.git`
3. `cd vim`
4. `./configure --enable-python3interp --disable-netbeans`
5. `make`
6. Copy `src/vim` to `~/Applications/vim/bin`
7. Add it to `$PATH` in `~/.bashrc`.
8. Make a directory `sudo mkdir /usr/local/share/vim`
9. Copy everything system vim there `sudo cp -r /usr/share/vim/vim73/* /usr/local/share/vim/`
10. May also need the file `rgb.txt` in `/usr/local/share/vim/`. The file can be found online

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
