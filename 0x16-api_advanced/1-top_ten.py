#!/usr/bin/python3
"""
    Task 1
"""
import requests


def top_ten(subreddit):
    """ gets the number of subscribers """
    r = requests.get('https://api.reddit.com/r/{}/hot.json'
                     .format(subreddit),
                     headers={'user-agent': 'ianscustomthing'},
                     allow_redirects=False)
    rj = r.json()
    if rj.get('message') == 'Not Found':
        print("None")
        return
    s = rj.get('data').get('children')
    for i in range(0, 10):
        print(s[i].get('data').get('title'))
