.RECIPEPREFIX = >
VENV = venv
PYTHON = $(VENV)/bin/python3
PIP = $(VENV)/bin/pip

.DEFAULT_GOAL := help

.PHONY: help test run clean

## help: Show Makefile targets
help:
> @ echo "Usage: make [target]\n"
> @ sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

## setup: Set up project and install requirements
setup: requirements.txt
> @echo "Set up project and install requirements"
#> @pip install -r requirements.txt

$(VENV)/bin/activate: requirements.txt
> @echo "Activate virtual environment"
#> $(PYTHON) -m $(VENV) ./venv
#> $(PIP) install -r requirements.txt

## start: Activate virtual environment
start: $(VENV)/bin/activate ## Activate virtual environment

## lint: Execute source code linters
lint:
> @echo "Execute source code linters"

## test: Execute source code tests
test: lint
> @echo "Execute source code tests"

## cover: Evaluate test coverage metrics for source code
cover: lint test
> @echo "Evaluate test coverage metrics for source code"

## run: Execute the application
run: $(VENV)/bin/activate
> @echo "Execute the application"
#> $(PYTHON) app.py

## clean: Remove all build, test, coverage and Python artefact
clean:
> @echo "Remove all build, test, coverage and Python artifacts"
#> find . -name '*.pyc' -exec rm -f {} +
#> find . -name '*.pyo' -exec rm -f {} +
#> find . -name '__pycache__' -exec rm -fr {} +
#> rm -rf $(VENV)
