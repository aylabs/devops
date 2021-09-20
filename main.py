import uvicorn
from fastapi import FastAPI

from code import data

app = FastAPI()
# Load the data in dataframe format
df = data.getDataframe()


@app.get('/')
def root():
    return {'message': 'Hello world!'}


@app.get('/tests')
def list_tests():
    print("Number of manufacturers of covid tests unique: ", len(list(df['manufacturer'].unique())))
    return list(df['manufacturer'].unique())


if __name__ == '__main__':
    uvicorn.run('main:app', host='0.0.0.0', reload=True)
