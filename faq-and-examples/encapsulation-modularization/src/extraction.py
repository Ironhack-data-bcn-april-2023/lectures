import os
import pandas as pd

def downloading (url, name):
    """This function downloads from a raw link and saves the dataframe locally.
    args:
    :url: string. the link
    :name: string. name to save the file
    """
    
    # 0. Establish variables
    path = f"data/{name}.csv"
    
    # 1. Download to the path
    command = f"curl {url} > {path}"
    os.system(command)
    
    # 2. We read from the path
    df = pd.read_csv(path)
    
    return df