## Makefile usage
- Create a new directory on the terminal
- Add the `Makefile` to any new python project
- Ensure python `virtualenv` is installed on the host machine by running `make install`
- Activate the virtual environment by running `make start`
- Execute your development tasks and proceed with normal workflow
- Deactivate the virtual environment by running `make stop`
- Update project requirements by running `make list`
- Remove python residual artifacts by running `make clean`
- Terminate and destroy a virtual environment by running `make delete`

```
Usage: make [target]
    help    Show Makefile targets
    install Install python venv on host
    setup   Set up project and install dependencies
    list    List project installation dependencies
    lint    Execute linters
    test    Execute tests
    cover   Evaluate test coverage metrics for source code
    start   Activate the virtual environment
    stop    Terminate the virtual environment
    run     Execute the application
    clean   Remove all build, test, coverage and Python artifact
    delete  Remove python virtual environment
```
---
