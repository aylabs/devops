import json
import uvicorn
import pandas as pd
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def root():
    return {'message': 'Hello World'}

@app.get("/tests")
def list_tests():
    data = json.load(open('./data/device-covid19serology-0001-of-0001.json'))
    df = pd.DataFrame(data["results"])

    return df.manufacturer

if __name__ == '__main__':
    uvicorn.run('main:app', host='0.0.0.0', reload=True)