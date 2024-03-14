# Makefile

# Specify path to virtual environment to use for this project
VENV_PATH := .venv

# Specify the package name
PACKAGE = my_package

# Ensures all commands for a given target are run in the same shell
# Facilitates running installations in the specified venv
.ONESHELL:

# Default command for `make`
.DEFAULT_GOAL: install-dev

# Targets that do not correspond to files
.PHONY: install install-dev build doc clean clean-doc format check-format test cov

# Production installation
install: pyproject.toml #venv
	. $(VENV_PATH)/bin/activate
	python -m pip install --upgrade pip setuptools wheel
	python -m pip install .

# Development installation
# Install dependencies specified in .dev of pyproject.toml
install-dev: pyproject.toml   #venv
	. $(VENV_PATH)/bin/activate
	python -m pip install --upgrade pip setuptools wheel
	python -m pip install -e ".[dev]"

# Build
build:
	python -m pip install build
	python -m build

# Build docs
doc:
	cd docs && \
	sphinx-apidoc -o source ../src && \
	make html

# Remove build folders
clean:
	@if [ -d ".dist" ]; then rm -r .dist; fi
	@if [ -d "src/${PACKAGE}.egg-info" ]; then rm -r src/${PACKAGE}.egg-info; fi

# Clean documentation
clean-doc:
	@if [ -f "docs/source/modules.rst" ]; then rm docs/source/modules.rst; fi
	@if [ -f "docs/source/${PACKAGE}.rst" ]; then rm docs/source/${PACKAGE}.rst; fi
	cd docs && make clean

# Apply formatting
format:
	isort src/${PACKAGE} tests/
	isort tests/
	black src/${PACKAGE}
	black tests/
	ruff check src/${PACKAGE}
	ruff check tests/

# Check formatting
check-format:
	ruff check src/${PACKAGE} --output-format=github
	ruff check tests/ --output-format=github
	isort --check src/${PACKAGE}
	isort --check tests/
	black --check src/${PACKAGE}
	black --check tests/

# Run unit tests.
# Base pytest options are inherited from pyproject.toml
# tox options are specified in tox.ini
test:
	tox

# Run codecov
cov:
	pytest --cov=src/ --cov-report term --cov-fail-under=-1
