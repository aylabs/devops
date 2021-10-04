import json
import pandas as pd

# print("Converting data from json to csv...")

""" JSON TO DATAFRAME """

# data = json.load(open('../data/device-covid19serology-0001-of-0001.json'))

# df = pd.DataFrame(data["results"])
"""print(df)"""

""" DATAFRAME TO CSV """

# df.to_csv('../data/device-covid19serology-0001-of-0001.csv', index = None)

# I comment the content of the file and adapt it to a function that returns the dataframe from the data.

def getDataframe():
    data = json.load(open('./data/device-covid19serology-0001-of-0001.json'))
    return pd.DataFrame(data["results"])
