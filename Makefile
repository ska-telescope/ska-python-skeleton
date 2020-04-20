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
