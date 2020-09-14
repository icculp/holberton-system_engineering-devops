#!/usr/bin/python3
"""
    Task 1
"""
import requests
from sys import argv
import csv


rusr = requests.get('https://jsonplaceholder.typicode.com/users/{}'
                    .format(argv[1]))
rtodo = requests.get('https://jsonplaceholder.typicode.com/users/{}/todos'
                     .format(argv[1]))
jusr = rusr.json()
jtodo = rtodo.json()

done = len(jtodo)
notdone = 0
name = jusr.get('username')
fname = argv[1] + ".csv"
with open(fname, mode='w') as user_file:
    user_writer = csv.writer(user_file, delimiter=',', quotechar='"',
                             quoting=csv.QUOTE_ALL)
    for t in jtodo:
        user_writer.writerow([argv[1], name, t.get('completed'),
                             t.get('title')])
'''
for t in jtodo:
    if t.get('completed') is True:
        notdone = notdone + 1

print("Employee {} is done with tasks({}/{}):".format(name, notdone, done))
for t in jtodo:
    if t.get('completed') is True:
        print("\t{}".format(t.get('title')))
'''
