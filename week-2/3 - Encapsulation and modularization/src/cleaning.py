import pandas as pd
import os

def rename_and_drop (path):
    df = pd.read_csv(path)
    df.columns = [i.upper().replace(" ", "_") for i in df.columns]
    df.dropna(axis= 1, inplace=True)
    return df

def export_and_open (df, path):
    df.to_csv(path)
    os.system(f"open {path}")

df = rename_and_drop("https://raw.githubusercontent.com/datapackage-examples/sample-csv/master/sample.csv")
export_and_open(df, "cleaned.csv")