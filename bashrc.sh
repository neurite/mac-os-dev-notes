#!/bin/bash

if [ ! -e "${HOME}/.bashrc" ]; then
    touch "${HOME}/.bashrc"
fi

mkdir -p "${HOME}/Applications"
if [[ ! $(grep -E 'APPS_HOME' "${HOME}/.bashrc") ]]; then
    echo '# APPS_HOME' >> "${HOME}/.bashrc"
    echo 'export APPS_HOME="${HOME}/Applications"' >> "${HOME}/.bashrc"
fi

mkdir -p "${HOME}/Packages"
