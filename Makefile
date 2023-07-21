# Use bash shell with pipefail option enabled so that the return status of a
# piped command is the value of the last (rightmost) commnand to exit with a
# non-zero status. This lets us pipe output into tee but still exit on test
# failures.
SHELL = /bin/bash
.SHELLFLAGS = -o pipefail -c

all: test lint

# The following steps copy across useful output to this volume which can
# then be extracted to form the CI summary for the test procedure.
test:

	 python setup.py test | tee ./build/setup_py_test.stdout; \
	 mv coverage.xml ./build/reports/code-coverage.xml;

# The following steps copy across useful output to this volume which can
# then be extracted to form the CI summary for the test procedure.
lint:

	# FIXME pylint needs to run twice since there is no way go gather the text and junit xml output at the same time
	pip3 install pylint2junit; \
	pylint --output-format=parseable src/ska/skeleton | tee ./build/code_analysis.stdout; \
	pylint --output-format=pylint2junit.JunitReporter src/ska/skeleton > ./build/reports/linting.xml;


.PHONY: all test lint

NOTEBOOK_IGNORE_FILES = not notebook.ipynb

#
# include makefile to pick up the standard Make targets, e.g., 'make build'
# build, 'make push' docker push procedure, etc. The other Make targets
# ('make interactive', 'make test', etc.) are defined in this file.
#

# include OCI Images support
include .make/oci.mk

# include k8s support
include .make/k8s.mk

# include Helm Chart support
include .make/helm.mk

# Include Python support
include .make/python.mk

# include raw support
include .make/raw.mk

# include core make support
include .make/base.mk

# include your own private variables for custom deployment configuration
-include PrivateRules.mak
