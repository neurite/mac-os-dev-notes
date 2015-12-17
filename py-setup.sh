#!/bin/bash

# IPython
mkdir -p ~/Applications/virtualenvs
cd ~/Applications/virtualenvs
virtualenv ipython
source ipython/bin/activate
pip install --upgrade pip
# upgrade all the packages
pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install --upgrade
# replaces libedit of Mac OS X for command line editing, tab completion, etc.
pip install gnureadline
# ipython dependency for testing
pip install nose
# for ipython’s inter-process communication and Qt console
pip install pyzmq pygments
pip install ipython[all]
cd ..
pip freeze > ipython.txt
deactivate
cd
echo 'alias env-ipython="source ~/Applications/virtualenvs/ipython/bin/activate"' >> ~/.bashrc

# The SciPy Stack
mkdir -p ~/Applications/virtualenvs
cd ~/Applications/virtualenvs
virtualenv scipy
source scipy/bin/activate
pip install --upgrade pip
pip install -r ipython.txt
pip install numpy
pip install scipy
# matplotlib 1.5.0 and up does work with virtualenv on Mac OS
pip install matplotlib==1.4.3
pip install pandas
pip install sympy
pip freeze > scipy.txt
deactivate
cd
echo 'alias env-scipy="source ~/Applications/virtualenvs/scipy/bin/activate"' >> ~/.bashrc

# scikit-learn
mkdir -p ~/Applications/virtualenvs
cd ~/Applications/virtualenvs
virtualenv scikit-learn
source scikit-learn/bin/activate
pip install --upgrade pip
pip install -r scipy.txt
pip install scikit-learn
pip freeze > scikit-learn.txt
deactivate
cd
echo 'alias env-scikit="source ~/Applications/virtualenvs/scikit-learn/bin/activate"' >> ~/.bashrc

# BeautifulSoup
mkdir -p ~/Applications/virtualenvs
cd ~/Applications/virtualenvs
virtualenv bs4
source bs4/bin/activate
pip install --upgrade pip
pip install -r ipython.txt
pip install requests
pip install beautifulsoup4
pip freeze > bs4.txt
deactivate
cd
echo 'alias env-bs4="source ~/Applications/virtualenvs/bs4/bin/activate"' >> ~/.bashrc
