import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

dataset = pd.read_csv("top_10000_1950-now.csv")
dataset = dataset.dropna(subset=['Album Release Date'], inplace=False)

def assign_decade(year):
    if 1960 <= year < 1970:
        return "1960s"
    elif 1970 <= year < 1980:
        return "1970s"
    elif 1980 <= year < 1990:
        return "1980s"
    elif 1990 <= year < 2000:
        return "1990s"
    elif 2000 <= year < 2010:
        return "2000s"
    elif 2010 <= year < 2020:
        return "2010s"
    elif 2020 <= year < 2030:
        return "2020s"
    else:
        return None

dataset['Year'] = dataset['Album Release Date'].str[:4].astype(int)
dataset['Decade'] = dataset['Year'].apply(assign_decade)

dataset = dataset.dropna(subset=['Decade', 'Danceability'])

ordered_decades = ["1960s", "1970s", "1980s", "1990s", "2000s", "2010s", "2020s"]
dataset['Decade'] = pd.Categorical(dataset['Decade'], categories=ordered_decades, ordered=True)


plt.figure(figsize=(12, 6))
sns.boxplot(x='Decade', y='Danceability', data=dataset, palette='Set3')
plt.title('Danceability nach Jahrzehnten')
plt.xlabel('Jahrzehnt')
plt.ylabel('Danceability')
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()
