import os
import matplotlib

def visualizing (df, name):
    """This function groups by type 
    and creates a bar chart with avgeprice
    Arguments
    :df: df. dataframe to group
    :name: string. name to save
    """
    
    # 1. Groupby & visualize
    df.groupby(['type'])[["averageprice"]].mean()
    df.groupby(['type'])[["averageprice"]].mean().plot.bar().get_figure().savefig(f'images/{name}')
    
    # 2. Open
    os.system(f"open images/{name}.png")