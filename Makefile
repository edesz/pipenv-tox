.DEFAULT_GOAL := one
.EXPORT_ALL_VARIABLES:
PIPENV_VERBOSITY=-1

## Run one
one:
	@echo "+ $@"
	@tox -e one
.PHONY: one

## Run tests
tests:
	@echo "+ $@"
	@tox -e tests
.PHONY: tests

## Clean
clean:
	@echo "+ $@"
	@rm -f Pipfile.lock
	@rm -rf .tox/ src/.coverage
	@rm -rf src/__pycache__ src/tests/__pycache__ src/htmlcov
	@tree .
.PHONY: two

list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
.PHONY: list
