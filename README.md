# GEOAnalytics Containers

This repository contains the Dockerfiles and associated scripts to build the developer environment containers for the GEOAnalytics Canada Platform. 

Maintainers:

- Benjamin Smith
- Jason Suwala

Company: Hatfield Consultants

Authors:

- Benjamin Smith
- Hugging Face Code (reviewed by Benjamin Smith)

## Resources

[Jupyter Extension List](https://jupyterlab-contrib.github.io/extensions.html)

## Installed Jupyter Extensions

https://github.com/jtpio/jupyterlab-system-monitor
https://github.com/deshaw/jupyterlab-execute-timejupyterlab_execute_time
https://github.com/jupyterlab/jupyter-renderers/tree/master/packages/geojson-extension

## Building the Containers

### Base Image

To build the base image - the manifest that delays application building to the
inheriting image build and only focuses on the base/core needs,
run the command below:

```bash
task build-base
```

### EO Image

Running the command below will trigger those delayed build commands to
check for the files copied from the directory to the image.
These configuration files allow for the customization and subsectioning
of specific environment needs in order to expose only the minimal set of
tools needed for a specific environment or tool needs.

```bash
task build-eo
```

### Experimental Image

The experimental image builds off of the base image created above and adds
additional data science tools atop the base image. The general thought here is
that the experimental image is a more refined version of the environment to be
used primarily for prototyping purposes. 

```bash
task build-experimental
```
