# testiranje.py
import sys
import pytest

def test_python_version(python_version):
    expected_major, expected_minor = map(int, python_version.split('.'))
    assert sys.version_info.major == expected_major and sys.version_info.minor == expected_minor, "Python version mismatch"
