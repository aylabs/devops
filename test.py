from unittest import TestCase

from fastapi.testclient import TestClient

from main import app


class TestCovidEndpoints(TestCase):

    def test_list_endpoint_works(self):
        client = TestClient(app)

        response = client.get('/tests')

        self.assertEqual(response.status_code, 200)

    def test_not_exists_endpoint_is_404(self):
        client = TestClient(app)

        response = client.get('/tests1')

        self.assertEqual(response.status_code, 404)


