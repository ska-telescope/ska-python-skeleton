#!/usr/bin/env bash
echo "STATIC CODE ANALYSIS"
echo "===================="
echo

echo "MODULE ANALYSIS"
echo "---------------"
pylint ska_python_skeleton

echo "TESTS ANALYSIS"
echo "--------------"
pylint tests
