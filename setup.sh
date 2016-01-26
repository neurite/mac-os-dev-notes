#!/bin/bash

MAC_NOTES_FOLDER="${HOME}/Workspace/mac-os-x-notes"
if [ ! -r "${MAC_NOTES_FOLDER}" ]; then
    echo "Erroc reading ${MAC_NOTES_FOLDER}" 1>&2
    exit 1
fi

chmod +x "${MAC_NOTES_FOLDER}/bashrc.sh"
"${MAC_NOTES_FOLDER}/bashrc.sh"

if [ -e "${HOME}/.bash_profile" ]; then
    mv "${HOME}/.bash_profile" "${HOME}/.bash_profile_old"
fi
cp "${MAC_NOTES_FOLDER}/.bash_profile" "${HOME}/.bash_profile"
. "${HOME}/.bash_profile"

if [ -e "${HOME}/.vimrc" ]; then
    mv "${HOME}/.vimrc" "${HOME}/.vimrc_old"
fi
cp "${MAC_NOTES_FOLDER}/.vimrc" "${HOME}/.vimrc"

chmod +x "${MAC_NOTES_FOLDER}/java.sh"
"${MAC_NOTES_FOLDER}/java.sh"

chmod +x "${MAC_NOTES_FOLDER}/python.sh"
"${MAC_NOTES_FOLDER}/python.sh"
