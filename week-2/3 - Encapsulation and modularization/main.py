from src.cleaning import *

df = rename_and_drop("https://raw.githubusercontent.com/datapackage-examples/sample-csv/master/sample.csv")
export_and_open(df, "cleaned.csv")