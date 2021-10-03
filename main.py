import uvicorn
from fastapi import FastAPI
import sys

sys.path.insert(0, './code')
import data

data_frame = data.getDataframe()
app = FastAPI()

@app.get('/')
def root():
    return {'message': 'Its test!'}

@app.get('/tests')
def list_tests():
    print("Data contain", len(list(data_frame)), "categories")
    return data_frame

if __name__ == '__main__':
    uvicorn.run('main:app', host='0.0.0.0', reload=True)
