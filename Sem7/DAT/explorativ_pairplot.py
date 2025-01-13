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

subset = dataset.dropna(subset=['Danceability', 'Energy', 'Decade'])
subset = subset[['Danceability', 'Energy', 'Decade']]

sns.pairplot(
    data=subset,
    vars=['Energy', 'Danceability'],
    hue='Decade',
    diag_kind='kde',
    palette='Set2'
)
plt.suptitle('Pairplot: Angepasste Achsen', y=1.02)
plt.show()
