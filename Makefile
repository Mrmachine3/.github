NC := $(shell tput sgr0)
GRN := $(shell tput setaf 2)
RED := $(shell tput setaf 1)
YLW := $(shell tput setaf 3)
CYN := $(shell tput setaf 6)

OK=$(GRN)[OK] $(NC)
ERR=$(RED)[ERROR] $(NC)
WRN=$(YLW)[WARN] $(NC)

.RECIPEPREFIX = >
GREEN = '\033[0;32M'
VENV = env
PYTHON = $(VENV)/bin/python3
PIP = $(VENV)/bin/pip

.DEFAULT_GOAL := help

.PHONY: help hello lint test cover run clean delete

hello:
> @echo "$(GRN)Welcome to your new Python virtual environment!$(NC)"

## help: Show Makefile targets
help: 
> @ echo "Usage: make [target]\n"
> @ sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

## install: Install python venv on host
install: 
> sudo apt install python3-venv -y

### setup: Set up project and install dependencies
#setup: requirements.txt
#> pip install -r requirements.txt 

## list: List project installation dependencies
list: requirements.txt $(VENV)
> @$(PIP) freeze | tee requirements.txt

$(VENV)/bin/activate: requirements.txt
> @echo "$(GRN)Activating virtual environment...$(NC)"
> @python3 -m venv $(VENV)
> @$(PIP) install -r requirements.txt
> @echo "$(GRN)Project requirements installed...$(NC)"

## lint: Execute linters
lint:
> @echo "$(GRN)Executing linters...$(NC)"

## test: Execute tests
test: lint
> @echo "$(GRN)Executing tests...$(NC)"
                        
## cover: Evaluate test coverage metrics for source code
cover: lint test
> @echo "$(GRN)Evaluating test coverage metrics for source code...$(NC)"

## start: Activate the virtual environment
start: $(VENV)/bin/activate
> @echo "$(GRN)Virtual environment ready...$(NC)"
> @echo "$(CYN)Enter the following: $(NC)"
> @echo "$(CYN)\t. ./$(VENV)/bin/activate$(NC)"

## stop: Terminate the virtual environment
stop: 
> @echo "$(CYN)Enter the following: $(NC)"
> @echo "$(CYN)\t deactivate$(NC)"

## run: Execute the application
run: $(VENV)/bin/activate
> @echo "$(GRN)|======== RUNNING APPLICATION ========|$(NC)\n"
> @$(PYTHON) main.py

## clean: Remove all build, test, coverage and Python artefact
clean:
> @deactivate
> @echo "$(YLW)Removing all unnecessary build, test, coverage and Python artifacts...$(NC)"
> @find . -type f \( -name "*.pyc" -o -name "*.pyo" \) -exec rm -rf {} \;
> @find . -type d -name "__pycache__" -exec rm -rf {} +

## delete: Remove python virtual environment
delete: clean
> @echo "$(RED)Removing virtual environment...$(NC)"
> @rm -rf $(VENV)

