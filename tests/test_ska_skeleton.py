#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Tests for the ska_python_skeleton module."""
import pytest

from ska.ska_python_skeleton import ska_python_skeleton


# TODO: Replace all the following examples with tests for the ska_python_skeleton package code
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


def test_ska_python_skeleton(an_object):
    """Example: Assert fixture return value."""
    assert an_object == {}


def test_package():
    """Example: Assert the ska_python_skeleton package code."""
    assert ska_python_skeleton.function_example() is None
    foo = ska_python_skeleton.SKA()
    assert foo.example_2() == 2
    assert foo.example() is None
