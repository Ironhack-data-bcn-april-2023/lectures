import pandas as pd

def basic_cleaning (df):
    """
    This function renames columns, drops index and drops nans.
    args
    :df: dataframe to be cleaned
    return: cleaned dataframe
    """
    
    # 1. Modify the dataframe
    df.drop(["Unnamed: 0"], axis=1, inplace=True)
    df.dropna(how="any", inplace=True)
    df.columns = [i.lower().replace(" ", "-") for i in df.columns]
    
    # 2. Export and read
    df.to_csv("data/avocado_clean.csv", index=False)
    df = pd.read_csv("data/avocado_clean.csv")
    
    return df