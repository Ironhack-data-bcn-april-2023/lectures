import pandas as pd
import os
def transformation (df):
    os.system("say cleaning")
    print("---CLEANING---")
    df["price"] = df["price"].astype("float")
    df.to_csv("data/clean.csv")
    return df
