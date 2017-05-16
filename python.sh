#!/usr/bin/env bash

### MAC_NOTES_FOLDER
MAC_NOTES_FOLDER="${HOME}/Workspace/mac-os-x-notes"
if [ ! -r "${MAC_NOTES_FOLDER}" ]; then
    echo "Error reading ${MAC_NOTES_FOLDER}" 1>&2
    exit 1
fi

### Check that conda is installed
if [[ ! $(which conda) ]]; then
    echo "Cannot find command 'conda'" 1>&2
    echo "Please install anaconda or miniconda" 1>&2
    exit 1
fi

### .bashrc
chmod +x "${MAC_NOTES_FOLDER}/bashrc.sh"
"${MAC_NOTES_FOLDER}/bashrc.sh"

### The Python section
if [[ ! $(grep '# python' "${HOME}/.bashrc") ]]; then
    echo '# python' >> "${HOME}/.bashrc"
fi

# Check if a conda env already exists
function check_conda_env() {
    if [[ $(conda env list | grep -E ".+/envs/${1}$") ]]; then
        # As bash functions cannot return values, use command substitution
        echo "true"
        return 0
    fi
    return 0
}

### ipython (or jupyter)
if [[ ! $(check_conda_env ipython) ]]; then
    cd
    conda create --yes --name ipython python=3
    source activate ipython
    conda install --yes ipython-notebook
    conda install --yes requests
    conda install --yes sqlite
    source deactivate
    echo 'alias env-ipython="source activate ipython"' >> "${HOME}/.bashrc"
fi

### scikit-learn
if [[ ! $(check_conda_env sklearn) ]]; then
    cd
    conda create -y -n sklearn --clone ipython
    source activate sklearn
    conda install -y numpy
    conda install -y scipy
    conda install -y matplotlib
    conda install -y pandas
    conda install -y sympy
    conda install -y scikit-learn
    conda install -y seaborn
    source deactivate
    echo 'alias env-sklearn="source activate sklearn"' >> "${HOME}/.bashrc"
fi

### scikit-image
if [[ ! $(check_conda_env skimage) ]]; then
    cd
    conda create -y -n skimage --clone sklearn
    source activate skimage
    conda install -y scikit-image
    source deactivate
    echo 'alias env-skimage="source activate skimage"' >> "${HOME}/.bashrc"
fi
