# Coded By ASTRO
import sys
from googlesearch import search
url = sys.argv
query = url[1]
for i in search(query, start=0, stop=None,num=10):
    print(i)

