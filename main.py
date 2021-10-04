import uvicorn
from fastapi import FastAPI
import sys
import data

sys.path.insert(0, './code')
app = FastAPI()

@app.get("/")
def root():
    return ["root"]

@app.get("/tests")
def list_tests():
    tests = data.df["device"].unique().tolist()
    return tests

if __name__ == '__main__':
    uvicorn.run("main:app", host="0.0.0.0", reload=True)

