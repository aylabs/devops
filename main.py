import uvicorn
from fastapi import FastAPI

app = FastAPI()

@app.get('/')
def root():
    return {'message': 'Hello World'}

@app.get('/tests')
def list_tests():
    return ['test1', 'test2', 'test3']

if __name__ == '__main__':
    uvicorn.run('main:app', host='0.0.0.0', reload=True)