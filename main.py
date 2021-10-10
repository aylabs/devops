import uvicorn
from fastapi import FastAPI, Request
from fastapi.templating import Jinja2Templates

from code import data

app = FastAPI()
templates = Jinja2Templates(directory="templates")

# Load the data in dataframe format
df = data.getDataframe()


@app.get('/')
def root(request:Request):
    return templates.TemplateResponse("root.html", {"request":request})


@app.get('/tests')
def list_tests(request:Request):
    print("Number of manufacturers of covid tests unique: ", len(list(df['manufacturer'].unique())))
    manufacturers = list(df['manufacturer'].unique())
    print(manufacturers)
    return templates.TemplateResponse("tests_manufacturers.html", {"request": request, "list": manufacturers})

if __name__ == '__main__':
    uvicorn.run('main:app', host='0.0.0.0', reload=True)
