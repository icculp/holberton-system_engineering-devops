#!/usr/bin/python3
"""
    Task 333
"""
import requests
import json


rusr = requests.get('https://jsonplaceholder.typicode.com/users')
jusr = rusr.json()
retd = dict()
for usr in jusr:
    ul = []
    uid = usr.get('id')
    uname = usr.get('username')
    rtodo = requests.get('https://jsonplaceholder.typicode.com/users/{}/todos'
                         .format(uid))
    for do in rtodo.json():
        ul.append({"username": uname, "task": do.get('title'), "completed":
                  do.get('completed')})
    retd.update({uid: ul})

fname = "todo_all_employees.json"
with open(fname, mode='w') as user_file:
    json.dump(retd, user_file, sort_keys=True)

'''

rtodo = requests.get('https://jsonplaceholder.typicode.com/users/{}/todos'
                     .format(argv[1]))
jusr = rusr.json()
jtodo = rtodo.json()

done = len(jtodo)
notdone = 0
uname = jusr.get('username')
name = jusr.get('name')

retl = []
for t in jtodo:
    retl.append({"task": t.get('title'), "completed": t.get('completed'),
                "username": uname})
retd.update({argv[1]: retl})
with open(fname, mode='w') as user_file:
    json.dump(retd, user_file)
'''
