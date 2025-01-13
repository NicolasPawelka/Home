import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

dataset = pd.read_csv("top_10000_1950-now.csv")
dataset = dataset.dropna(subset=['Album Release Date'], inplace=False)

data_explicit = dataset["Explicit"]
data_release_date = dataset["Album Release Date"]

df = pd.concat([data_explicit, data_release_date], axis=1)

count = [0] * 75
years = range(1950, 2025)
year_count = [0] * 75

for _, row in df.iterrows():
    year = int(row[1][0:4])
    tmp = year - 1950
    if row[0] == True:
        count[tmp] += 1
    if 1950 <= year <= 2025:
        year_count[tmp] += 1

data = pd.DataFrame({"Jahr": years, "Explizite Songs": count})
data_year_count = pd.DataFrame({"Jahr": years, "Gesamtanzahl Songs": year_count})

fig, axes = plt.subplots(2, 1, figsize=(14, 10), sharex=True)
sns.barplot(ax=axes[0], x="Jahr", y="Explizite Songs", data=data, color="blue")
axes[0].set_title("Explizite Songs pro Jahr")
axes[0].set_ylabel("Anzahl Expliziter Songs")
axes[0].tick_params(axis='x', rotation=45)

sns.barplot(ax=axes[1], x="Jahr", y="Gesamtanzahl Songs", data=data_year_count, color="green")
axes[1].set_title("Gesamtanzahl Songs pro Jahr")
axes[1].set_xlabel("Jahre")
axes[1].set_ylabel("Anzahl Gesamtanzahl Songs")
axes[1].tick_params(axis='x', rotation=45)

plt.tight_layout()
plt.show()
