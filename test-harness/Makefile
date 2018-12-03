# With a command like 'pytest | tee output.txt', make must launch subshells
# with '-o pipefail' otherwise the exit code is that of tee and not that of
# pytest.
SHELL=/bin/bash
.SHELLFLAGS=-o pipefail -c

all: test

# A temporary volume is mounted at /build when 'make test' is executing.
# The 'if [ -d /build ]...' steps copy across useful output to this volume
# which can then be extracted to form the CI summary for the test procedure.
test:
	cd /app && ./code-analysis.sh | tee code_analysis.stdout.txt
	cd /app && python setup.py test | tee setup_py_test.stdout.txt; \
		status=$$?; \
		if [ -d /build ]; then \
			mv /app/setup_py_test.stdout.txt /build; \
			mv /app/code_analysis.stdout.txt /build; \
			mv /app/htmlcov /build; \
			mv /app/coverage.xml /build; \
		fi; \
		exit $$status

.PHONY: all test
