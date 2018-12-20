#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for the ska_skeleton module."""
import pytest

from ska_skeleton import ska_skeleton


# TODO: Replace all the following examples with tests for the ska_skeleton package code
def test_something():
    """Example: Assert with no defined return value."""
    assert True


def test_with_error():
    """Example: Assert raising error."""
    with pytest.raises(ValueError):
        # Do something that raises a ValueError
        raise ValueError


# Fixture example
@pytest.fixture
def an_object():
    """Example: Define fixture for subsequent test."""
    return {}


def test_ska_skeleton(an_object):
    """Example: Assert fixture return value."""
    assert an_object == {}


def test_package():
    """Example: Assert the ska_skeleton package code."""
    assert ska_skeleton.example() is None
    assert ska_skeleton.testing_example() == 2

	
def test_code_climate():	
	lower = 900
	upper = 1000
	print("Prime numbers between", lower, "and", upper, "are:")
	for num in range(lower, upper + 1):
	   if num > 1:
		   for i in range(2, num):
			   if (num % i) == 0:
				   break
		   else:
			   print(num)
