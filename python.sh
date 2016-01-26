#!/bin/bash

### MAC_NOTES_FOLDER
MAC_NOTES_FOLDER="${HOME}/Workspace/mac-os-x-notes"
if [ ! -r "${MAC_NOTES_FOLDER}" ]; then
    echo "Erroc reading ${MAC_NOTES_FOLDER}" 1>&2
    exit 1
fi

### .bashrc
chmod +x "${MAC_NOTES_FOLDER}/bashrc.sh"
"${MAC_NOTES_FOLDER}/bashrc.sh"
echo '# python' >> ~/.bashrc

### IPython
cd
conda create -y -n ipython python=2
source activate ipython
conda install -y -c anaconda ipython-notebook
source deactivate
echo 'alias env-ipython="source activate ipython"' >> ~/.bashrc
conda create -y -n ipython3 python=3
source activate ipython3
conda install -y -c ananconda ipython-notebook
source deactivate
echo 'alias env-ipython3="source activate ipython3"' >> ~/.bashrc

### The SciPy Stack
cd
conda create -y -n scipy python=2
source activate scipy
conda install -y -c anaconda ipython-notebook
conda install -y -c anaconda numpy
conda install -y -c anaconda scipy
conda install -y -c anaconda matplotlib
conda install -y -c anaconda pandas
conda install -y -c anaconda sympy
source deactivate
echo 'alias env-scipy="source activate scipy"' >> ~/.bashrc
conda create -y -n scipy3 python=3
source activate scipy3
conda install -y -c anaconda ipython-notebook
conda install -y -c anaconda numpy
conda install -y -c anaconda scipy
conda install -y -c anaconda matplotlib
conda install -y -c anaconda pandas
conda install -y -c anaconda sympy
source deactivate
echo 'alias env-scipy3="source activate scipy3"' >> ~/.bashrc

### scikit-learn
cd
conda create -y -n sklearn python=2
source activate sklearn
conda install -y -c anaconda scikit-learn
source deactivate
echo 'alias env-sklearn="source activate sklearn"' >> ~/.bashrc
conda create -y -n sklearn3 python=3
source activate sklearn3
conda install -y -c anaconda scikit-learn
source deactivate
echo 'alias env-sklearn3="source activate sklearn3"' >> ~/.bashrc
