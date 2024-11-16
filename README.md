mac-os-dev-notes
================

### MacOS Clean Install

1. Prepare [a bootable USB disk of MacOS](https://www.google.com/search?q=bootable+USB+MacOS)
    1. [Create a bootable installer for MacOS](https://support.apple.com/en-us/HT201372)
    2. [Download MacOS](https://support.apple.com/en-us/HT211683)
2. Hold down the Option key when booting up.
3. Install the OS and then update. Note format the partition as `Mac OS Extended, Journaled`.

### Customize

* Update macOS first
    * General --> Software Update
* Appearance
    * Appearance --> Dark
    * Show scroll bars --> Always
* Desktop & Dock
    * Dock
        * Position on screen --> Left
        * Automactically hide and show -- Enable
        * Show recent applications in dock --> Disable
    * Hot Corners --> Disable all
* Keyboard
    * Text input - Input Sources Edit...
        * Correct spelling --> Disable
        * Capitalize words --> Disable
        * Add period with double space --> Disable
        * Use smart quotes and dashes --> Disable
        * Use " for double quote
        * Use ' for single quote
* Trackpad
    * Tap to click
* Network
    * Firewall --> Enable
* Siri --> Diable
* Spotlight --> Only "Applications" and "System Settings"
* Control Center
    * Battery --> Show percentage
    * Digital clock --> 24-hour clock
* Security & Privacy
    * FileVault --> Enable
* Finder --> Settings...

### Install

1. Chrome
2. Firefox
3. Xcode Command-Line Tools (download from developer.apple.com)
4. Source Code Pro from [Font Squirrel](http://www.fontsquirrel.com/fonts/list/classification/monospaced)
5. [Miniconda](https://conda.io/miniconda.html)
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

Run `vim --version` should see "-python3", the target is to add Python 3 support so that "+python3".

Befroe we proceed, make sure the Xcode Command-Line Tools are installed.

The source code of `vim` is checked out into `~/Downloads` and is compiled there. The compiled code is deployed to `~/Applications`. The `vim` in `~/Downloads` is zipped and moved to `~/Packages`. Here are the steps:

1. `cd ~/Downloads`
2. `git clone https://github.com/vim/vim.git`
3. `cd vim`
4. `./configure --enable-python3interp --disable-netbeans`
5. `make`
6. Copy `src/vim` to `~/Applications/vim/bin`
7. Add it to `$PATH` in `~/.bashrc`
8. Copy the `~/.vimrc` file
9. Make a directory `sudo mkdir -p /usr/local/share/vim`
10. Copy everything system vim there `sudo cp -r /usr/share/vim/vim73/* /usr/local/share/vim/`. Note `vm73` is the version of your vim executable
11. The file `/usr/local/share/vim/rgb.txt` is needed to show colors. The file can be found [online](https://github.com/vim/vim/blob/master/runtime/rgb.txt). Copy it from the checked out repository `sudo cp Downloads/vim/runtime/rgb.txt /usr/local/share/vim/`
12. Zip `~/Downloads/vim` and save it in `~/Packages`

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
