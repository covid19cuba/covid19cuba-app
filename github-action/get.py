from json import dump
from os import makedirs
from requests import get

url = 'https://covid19cuba.github.io/covid19cubadata.github.io/api/v2/'

names = [
    'about_us',
    'bulletins',
    'changelog',
    'downloads',
    'faqs',
    'news',
    'protocols',
    'tips',
    'full',
]

makedirs('assets/data', exist_ok=True)

for name in names:
    data = get(f'{url}{name}.json')
    with open(f'assets/data/{name}.json', mode='w', encoding='utf-8') as file:
        file.write(data.text)
