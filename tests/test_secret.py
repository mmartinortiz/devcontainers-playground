import os


def test_secret(test_client):
    my_secret = os.getenv("SECRET", "")
    response = test_client.get("/secret")
    assert response.status_code == 200
    assert response.json()["secret"] == my_secret
