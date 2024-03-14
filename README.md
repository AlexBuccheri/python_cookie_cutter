# Cookie Cutter Template

TODO: Add Badges for tests docs (target actions deployment) and license.

Python cookie cutter repository template

## QuickStart
* Fork under a different to `cookiecutter`
* Change the [package name](src/my_package), package name in [pyproject.toml](pyproject.toml) and update the `$PACKAGE` 
  variable in the [Makefile](Makefile)
* Create a venv in the project root: `python -m venv .venv`
* Install the project: `make`


## Features
* All project configuration is done in `pyproject.toml`
* Common commands delegated to [Makefile](Makefile), which runs in a venv
* Formatting with ruff, isort and black
  * Note, the defaults do IMO lead to some terrible-looking code
* Unit test multiple python versions with [tox](https://tox.wiki/en/4.14.1/)
* Documentation with Sphinx

Additional features to add are given in [todos.md](todos.md)


## Installation

Make a virtual environment in this folder and activate:

```shell
python -m venv .venv
source venv/bin/activate
```

If you choose to create a `venv` in a different location, or use a preexisting one, the `VENV_PATH` in [Makefile](Makefile)
must be updated for the commands to work in the expected environment.

Install the project for:
  * Production: `make install`
  * Development: `make install-dev`

All requirements will be handled by make and `[pyproject.toml](pyproject/toml).


## Commands

### Formatting and Linting

Check formatting and Linting:

```shell
make check-format
```

Apply formatting and Linting:

```shell
make format
```

### Run Tests

In the main environment, run:

```shell
pytest
```

For all supported environments:

```shell
tox
```

If a specific toc venv fails, one can switch to it:

```shell
# Change to python 3.9 venv
source .tox/py39/bin/activate
```

## Viewing Documentation

The sphinx documentation is built with:

```shell
make doc
```

viewed by opening the [main index](docs/build/html/index.html),

and cleaned with:

```shell
make clean-doc
```

Once built, documentation can be viewed via [docs/build/html/index.html](docs/build/html/index.html)


## Documentation - Getting Started with Sphinx

#### 1. Install Dependencies

Package dependencies and a default theme are installed via `make install-dev`
If not already present, generate sphinx files:

```shell
cd docs
sphinx-quickstart
```

#### 2. Update `conf.py`

Modify `conf.py` fields:
* project
* copyright
* author
* `extensions = ["sphinx.ext.autodoc", "sphinx.ext.viewcode", "sphinx.ext.todo"]`
* `html_theme = 'sphinx_rtd_theme'`

You should then populate your master file:
	* `$PROJECTROOT$/docs/source/index.rst `
	* Create other documentation source files

### Including docstrings in sphinx

Module files one wishes to add to the documentation **must** be in a folder that includes a `__init.py`, 
else they won't get picked up. Add `modules` to `index.rst`

```rtd
Welcome to My Package's documentation!  
=============================================  
  
.. toctree::  
   :maxdepth: 2  
   :caption: Contents:  
  
   modules
```

### Build Commands

```shell
make builder
```

where "builder" is one of the supported builders, e.g. `html`, `latex` or `linkcheck`

