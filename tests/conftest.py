import pytest
from fastapi.testclient import TestClient


@pytest.fixture
def test_client():
    from app.main import app

    return TestClient(app)
