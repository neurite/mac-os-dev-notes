if [ -r "${HOME}/.profile" ]; then
    . "${HOME}/.profile"
fi

# More .bash_profile script goes here

if [ -r "${HOME}/.bashrc" ]; then
    . "${HOME}/.bashrc"
fi
