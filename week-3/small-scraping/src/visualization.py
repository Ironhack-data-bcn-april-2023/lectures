import matplotlib.pyplot as plt
import os 

def plot_count_shoes (df):
    print("---plotting---")
    os.system("say plotting")


    df[["brand", "names"]].groupby("brand").agg({"names":"count"}).plot(kind="bar")
    plt.xticks(rotation=0.2)
    plt.savefig("images/plot_count_shoes")
    plt.show()

def plot_price_by_brand (df):
    print("---plotting---")
    df[["price", "brand"]].groupby("brand").agg({"price":"mean"}).plot(kind="bar")
    plt.xticks(rotation=0.2)
    plt.savefig("images/plot_price_by_brand")
    plt.show()