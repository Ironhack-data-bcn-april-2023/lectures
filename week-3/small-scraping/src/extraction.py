import requests
from bs4 import BeautifulSoup
import pandas as pd
import os 

def shoes ():
    print("---SCRAPPINGGG---")
    os.system("say scraping")
    url = "https://www.murallasport.com/29-zapatillas-moda-mujer"
    html = requests.get(url)
    soup = BeautifulSoup(html.content, "html.parser")

    names_list = soup.find_all("div", {"class":"name_product_box"})

    names = [i.getText().strip() for i in names_list]
    brand_list = soup.find_all("span", {"class":"marca-product-box"})
    brands = [i.getText().strip() for i in brand_list]
    price_list = soup.find_all("div", {"class": "price_product_box"})
    prices = [i.getText().strip().split("\n")[0].replace("€", "") for i in price_list]

    list_links = soup.find_all("div", {"class": "name_product_box"})
    links = [f"https://www.murallasport.com{i.span.a.get('href')}".strip() for i in list_links]

    all_together = {
        "names": names,
        "brand": brands,
        "price": prices,
        "links": links
    }

    return pd.DataFrame(all_together)


def get_description (url):
    print("---GETTING DESCRIPTION---")

    html = requests.get(url)
    soup = BeautifulSoup(html.content, "html.parser")
    results = soup.find("div", {"id": "description"})
    return results.getText().strip()