import src.cleaning as clean
import src.extraction as extract
import src.visualization as viz
import os

df = extract.shoes ()
df["description"] = df["links"].apply(extract.get_description)
clean.transformation (df)

viz.plot_count_shoes (df)
viz.plot_price_by_brand (df)

os.system("open images/plot_price_by_brand.png")
os.system("open images/plot_count_shoes.png")