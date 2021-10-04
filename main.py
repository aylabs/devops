import uvicorn
from fastapi import FastAPI
import sys
sys.path.insert(0, './code')
import data

app = FastAPI()

df = data.getDataframe()

@app.get("/")
def root():
    return ["root"]

@app.get("/tests")
def list_tests():
    return df.manufacturer

if __name__ == '__main__':
    uvicorn.run('main:app', host='0.0.0.0', reload=True)