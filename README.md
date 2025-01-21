# Spack

These repo contains configurations for the centrally installed version of spack.
The configuration is set using environment variables. The user can easily override these configurations to a custom directory.

The archer2 repo folder contains patches for broken or non-existent packages on ARCHER2.

## Using spack

### Loading spack

```bash
module load spack/0.23.0
```

### Useful commands

- `spack find`:  view installed packages. See `spack find -h` for options.
- `spack install ${SPEC}` : to install a specifick package name.
- `spack compilers` : show availabe compilers
- `spack list ` : shows all packages available in the repository

### Creating packages

A few examples can be found in the `custom_packages` subdirectory.

## Installing Spack

Navigate to the folder where you wish to install spack and clone this folder, including submodules.

```bash
git clone --recursive -b v0.23.0 https://github.com/EPCCed/spack-epcc-20241106.git
```

You can generate module files to load spack using

```bash
python scripts/generate_modules.py $VERSION --output $MY_MODULES_ROOT/spack
```

Finally you can test the spack installation by executing the `tests.sh` script.

```bash
cd scripts/tests
bash tests.sh
```

## Installing the CSE environment

This is an environment we can use to provide centrlly installed packages.
You can activate the environment with

```bash
spack env activate environments/archer2-cse
```

You will then need to install packages with

```bash
spack install
```

Finally generate modules with 

```bash
spack module lmod refresh --delete-tree -y
```

You can use the generated modules with

```bash
module use archer2-cse/module_entry
module load spack_epcc/1.0
```

You will be able to see all the packages compatible with your current programming environment. To view packages supported only for a certain compiler, load the corresponding cray programming environment. I.e. to see `openfoam`, which is only available within the gnu programming environment, use

```bash
module load PrgEnv-gnu
```