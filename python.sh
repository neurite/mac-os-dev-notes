#!/bin/bash

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

echo '# python' >> ~/.bashrc

### IPython
cd
conda create --yes --name ipython python=2
source activate ipython
conda install --yes --channel anaconda ipython-notebook
source deactivate
echo 'alias env-ipython="source activate ipython"' >> ~/.bashrc
conda create --yes --name ipython3 python=3
source activate ipython3
conda install --yes --channel anaconda ipython-notebook
source deactivate
echo 'alias env-ipython3="source activate ipython3"' >> ~/.bashrc

### The SciPy Stack
cd
conda create -y -n scipy --clone ipython
source activate scipy
conda install -y -c anaconda numpy
conda install -y -c anaconda scipy
conda install -y -c anaconda matplotlib
conda install -y -c anaconda pandas
conda install -y -c anaconda sympy
source deactivate
echo 'alias env-scipy="source activate scipy"' >> ~/.bashrc
conda create -y -n scipy3 --clone ipython3
source activate scipy3
conda install -y -c anaconda numpy
conda install -y -c anaconda scipy
conda install -y -c anaconda matplotlib
conda install -y -c anaconda pandas
conda install -y -c anaconda sympy
source deactivate
echo 'alias env-scipy3="source activate scipy3"' >> ~/.bashrc

### scikit-learn
cd
conda create -y -n sklearn --clone scipy
source activate sklearn
conda install -y -c anaconda scikit-learn
source deactivate
echo 'alias env-sklearn="source activate sklearn"' >> ~/.bashrc
conda create -y -n sklearn3 --clone scipy3
source activate sklearn3
conda install -y -c anaconda scikit-learn
source deactivate
echo 'alias env-sklearn3="source activate sklearn3"' >> ~/.bashrc
