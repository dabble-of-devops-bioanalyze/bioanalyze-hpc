### Configuration

#### General - .bashrc

#### Package Managers - Cache

It is *highly* recommended that you keep your `/home` directory as clear as possible. A very easy way to fill it up is to use package managers. Most package managers default to caching packages in your home directory.

Many package managers are already configured to write to `/apps/users/{USER}/package_manager_dir`.

For different package managers you will need to create your own symlinks 

```bash
# example for ~/.conda
# by default a symlink to /apps is already setup for you. 
# this example is only for demonstration purposes
ls -lah ~/.conda

mkdir -p /apps/users/${USER}/.conda
ln -s -f /apps/users/${USER}/.conda ~/
```

####  Package Managers - Conda

This is the recommended .condarc for your system. To learn more about channel priorities and why they are set the way they are please see the [bioconda](https://bioconda.github.io/) docs.

```bash
# This is the recommended conda confiugration
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

You can get this configuration with:

```bash
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge
conda config --set channel_priority strict
conda config --add create_default_packages ipykernel
conda config --add create_default_packages ipython
```

You can learn more about installing software with conda on the [install-software](../software/install-software.md) page.

####  Package Managers - R 

We *highly* recommend that you use conda to bootstrap your R environments.
