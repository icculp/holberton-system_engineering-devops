#!/usr/bin/python3
"""
    Task 3
"""
import requests


def recurse(subreddit, hot_list=[], after=None):
    """ gets the number of subscribers """
    if after is not None:
        url = 'https://api.reddit.com/r/' +\
              '{}/hot.json?after={}'.format(subreddit, after)
    else:
        url = 'https://api.reddit.com/r/{}/hot.json'.format(subreddit)
    header = {'user-agent': 'ianscustomthing'}

    r = requests.get(url,
                     headers=header,
                     allow_redirects=False)
    rj = r.json()
    if rj.get('message') == 'Not Found':
        return
    chldrn = rj.get('data').get('children')
    hot_list += [chld.get('data').get('title') for chld in chldrn]
    after = rj.get('data').get('after')
    if after is not None:
        return recurse(subreddit, hot_list, after)
    else:
        return hot_list


def count_words(subreddit, word_list):
    """ counts dem keywords """
    hot_list = recurse(subreddit)
    if hot_list is None:
        print()
        return
    cnts = {}
    for word in word_list:
        c = 0
        for title in hot_list:
            if word.strip().lower() in title.strip().lower():
                c = c + 1
        cnts.update({word.lower(): c})
    for k in sorted(cnts.keys()):
        if cnts.get(k) != 0:
            print("{}: {}".format(k, cnts.get(k)))
