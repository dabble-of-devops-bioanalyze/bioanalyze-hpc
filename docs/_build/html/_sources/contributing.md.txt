# Contributing

If you'd like to contribute to the documentation please do!

## Bootstrap

Grab the repo and create the conda environment. This will install sphinx and a whole bunch of other packages.

```bash
git clone https://git-this-repo.com
cd this-repo
conda env create -f datascience-env.yaml
conda activate datascience

# or mamba
# mamba env create -f datascience-env.yaml
```

## Serve Locally

Run the live html command. The documents will be available in the browser at port `8000`.

```bash
make livehtml
```
