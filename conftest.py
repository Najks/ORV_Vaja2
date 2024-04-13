# conftest.py
import pytest

def pytest_addoption(parser):
    parser.addoption("--python_version", action="store", default="3.8", help="Specifies the Python version for the tests")

@pytest.fixture
def python_version(request):
    return request.config.getoption("--python_version")
