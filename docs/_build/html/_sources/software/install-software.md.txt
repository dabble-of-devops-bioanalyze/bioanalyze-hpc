## Install Software

There are two main areas of software. The first is a centralized software area using [modules](https://lmod.readthedocs.io/en/latest/) and the second is a per user system using [conda](https://docs.conda.io/en/latest/).

You can always install your own software environments to the cluster using conda.

The cluster is already setup for you to install software using the [conda](https://docs.conda.io/en/latest/) package manager.

You can see the centrally installed software by running:

```
module avail
```

## Use Conda

```bash
module load Miniconda3
```

### Default conda configuration

```{admonition} We highly recommend that you use this  conda configuration. It is generally applicable for most bioinformatics software. 
```

```bash
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict
conda config --add create_default_packages ipykernel
conda config --add create_default_packages ipython
```

Run this command and you will be all set.

```{note} Configuring your conda only needs to be done once. 
```
You can check that your configuration has been applied by running:

```bash
cat ~/.condarc
```

```bash
# ~/.condarc
channels:
  - conda-forge
  - bioconda
  - defaults
channel_priority: strict
create_default_packages:
  - ipython
  - ipykernel
```

## Register your Software to Jupyter

In order to have your software appear on the Launcher page you'll need to first create the environment and then source it.

### Python

For python environments just create the conda environment as you typically would, and then install the kernelspec.

```bash
module load Miniconda3

# Optionally, create an environment
# The -n is for name
# conda create -n my-env -c conda-forge r-base ipykernel
source activate my-env 
python -m ipykernel install --user --name my-env --display-name "Python (my-env)"
```

### R 

For R environments you will need an extra step.

```bash
module load Miniconda3

# Optionally, create an environment
# The -n is for name
conda create -n my-r-env -c conda-forge r-base r-tidyverse ipykernel ipython r-irkernel
source activate my-r-env 
R -e "IRkernel::installspec(name = 'r-tidyverse-4', displayname = 'R 4.0')"
python -m ipykernel install --user --name my-r-env --display-name "R (my-env)"
```
