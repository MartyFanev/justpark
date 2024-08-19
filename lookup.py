import duckdb
import numpy 
import pandas 

prices = conn.execute("SELECT * FROM main_products.current_pricing_information").fetchdf()
prices.to_csv('./data_results/pricing_info.csv')

prices = conn.execute("SELECT * FROM main_products.time_series_price").fetchdf()
prices.to_csv('./data_results/time_pricing_info.csv')



