import src.extraction as extract
import src.cleaning as clean
import src.visualization as viz

df = extract.downloading("https://raw.githubusercontent.com/Ironhack-data-bcn-april-2023/lectures/main/datasets/avocado_kaggle.csv", "avocado_clean")
df_clean = clean.basic_cleaning(df)
viz.visualizing(df_clean, "avg_price_by_type")