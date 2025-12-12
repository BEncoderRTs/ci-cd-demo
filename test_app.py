import pytest
from app import app

def test_hello():
    # 模拟请求
    client = app.test_client()
    response = client.get('/')
    # 断言返回值正确
    assert response.status_code == 200
    assert response.data.decode('utf-8') == "Hello CI/CD!"