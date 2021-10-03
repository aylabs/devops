import json
import pandas as pd

print("Converting data from json to csv...")

""" JSON TO DATAFRAME """

#data = json.load(open('../data/device-covid19serology-0001-of-0001.json'))

#df = pd.DataFrame(data["results"])
"""print(df)"""

""" DATAFRAME TO CSV """

#df.to_csv('../data/device-covid19serology-0001-of-0001.csv', index = None)

""" GET DATAFRAME"""
def getDataframe():
    data_covid = json.load(open('./data/device-covid19serology-0001-of-0001.json'))
    return pd.DataFrame(data_covid["results"])