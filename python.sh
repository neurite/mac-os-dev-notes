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

### IPython
if [[ ! $(check_conda_env ipython) ]]; then
    cd
    conda create --yes --name ipython python=2
    source activate ipython
    conda install --yes --channel anaconda ipython-notebook
    conda install --yes --channel anaconda requests
    conda install --yes --channel anaconda sqlite
    source deactivate
    echo 'alias env-ipython="source activate ipython"' >> "${HOME}/.bashrc"
    conda create --yes --name ipython3 python=3
    source activate ipython3
    conda install --yes --channel anaconda ipython-notebook
    conda install --yes --channel anaconda requests
    conda install --yes --channel anaconda sqlite
    source deactivate
    echo 'alias env-ipython3="source activate ipython3"' >> "${HOME}/.bashrc"
fi

### scikit-learn
if [[ ! $(check_conda_env sklearn) ]]; then
    cd
    conda create -y -n sklearn --clone scipy
    source activate sklearn
    conda update -y --all
    conda install -y -c anaconda numpy
    conda install -y -c anaconda scipy
    conda install -y -c anaconda matplotlib
    conda install -y -c anaconda pandas
    conda install -y -c anaconda sympy
    conda install -y -c anaconda scikit-learn
    conda install -y -c anaconda seaborn
    source deactivate
    echo 'alias env-sklearn="source activate sklearn"' >> "${HOME}/.bashrc"
    conda create -y -n sklearn3 --clone scipy3
    source activate sklearn3
    conda update -y --all
    conda install -y -c anaconda numpy
    conda install -y -c anaconda scipy
    conda install -y -c anaconda matplotlib
    conda install -y -c anaconda pandas
    conda install -y -c anaconda sympy
    conda install -y -c anaconda scikit-learn
    conda install -y -c anaconda seaborn
    source deactivate
    echo 'alias env-sklearn3="source activate sklearn3"' >> "${HOME}/.bashrc"
fi

### scikit-image
if [[ ! $(check_conda_env skimage) ]]; then
    cd
    conda create -y -n skimage --clone sklearn
    source activate skimage
    conda update -y --all
    conda install -y -c anaconda scikit-image
    source deactivate
    echo 'alias env-skimage="source activate skimage"' >> "${HOME}/.bashrc"
    conda create -y -n skimage3 --clone sklearn3
    source activate skimage3
    conda update -y --all
    conda install -y -c anaconda scikit-image
    source deactivate
    echo 'alias env-skimage3="source activate skimage3"' >> "${HOME}/.bashrc"
fi
