import json
import pandas as pd

""" JSON TO DATAFRAME """

data = json.load(open('./data/device-covid19serology-0001-of-0001.json'))
df = pd.DataFrame(data["results"])
#print(df)

""" DATAFRAME TO CSV """
#df.to_csv('../data/device-covid19serology-0001-of-0001.csv', index = None)

def getDataframe():
    return df
