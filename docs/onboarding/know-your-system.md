### Get to Know Your System

Once you have a job running, either through the JupyterHub interface or with sbatch, you'll want to take a look around.

### File Systems 

Run `df -h` to view the filesystems. At a minimum you will have `/home`, `'/scratch'` and `/apps`. You may also have a `/fastscratch` lustre filesystem.

```bash
df -h
```

#### What are the different systems for?

Generally, an HPC system is a collaborative environment. It needs to support both group and project read/write access. 

On the default setup you can write to:

```bash
/home/${USER}
/scratch/ftp/${USER}
/apps/users/${USER}
```


#### Troubleshooting and Gotchas

It is much easier than you would think to fill up your home directory! We recommend that you use `/apps` for your home and `/scratch` for any large files. On most HPC systems your home is only a landing spot.
