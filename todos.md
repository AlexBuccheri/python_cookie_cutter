# Features to Add

## Basics

* Add licensing and contributions sections

## Deployment

* Add a deployment step to pypi staging page, for demonstration purposes


## Makefile

* Extend to other backends, like [Hatch](https://github.com/pypa/hatch), which provide an alternative to make.
  * Perhaps better as a separate cookie cutter project

* Have the [Makefile](Makefile) set up a venv if one is not present. Something like:

```make
venv/bin/activate: pyproject.toml
	@if [ ! -d "${VENV_PATH}" ]; then \
  		python -m venv ${VENV_PATH}; \
  		chmod +x $(VENV_PATH)/bin/activate; \
  	 fi

venv: venv/bin/activate
	. $(VENV_PATH)/bin/activate
```

* Make the [Makefile](Makefile) more generic, so it can run commands in venv or conda env


## Documentation

* Add some rtf documentation
* Use custom markers to extract source snippets and place into the docs
* Embed Jupyter into Sphinx
* Have Jupyter run in blender when deployed


## Github CI and Actions

* make commands should be used. Requires a venv being set up in the CI as an initial step

* Include tox in the CI. Although perhaps this is superfluous if one runs a matrix of python versions

* Include a cron job step, such that the CI runs once a week
  * Should include running all the make commands 
  * Have the CI fail for depreciation warnings
  * Should catch as things become outdated

* Build documentation in a separate workflow, and deploy to Github pages or ReadTheDocs

* Get codecov badge: https://python-basics-tutorial.readthedocs.io/en/latest/test/coverage.html
  Should require something like:

```yaml
      - name: "Create badge"
        uses: schneegans/dynamic-badges-action@v1.6.0
        with:
          auth: ${{ secrets.GIST_TOKEN }}
          gistID: YOUR_GIST_ID
          filename: covbadge.json
          label: Coverage
          message: ${{ env.total }}%
          minColorRange: 50
          maxColorRange: 90
          valColorRange: ${{ env.total }}
```
