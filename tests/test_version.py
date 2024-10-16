from app import __version__


def test_version(test_client):
    response = test_client.get("/version")
    assert response.status_code == 200
    assert response.json() == {"version": __version__}
