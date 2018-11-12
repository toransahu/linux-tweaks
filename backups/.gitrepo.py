#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
# created_on: 2018-11-12 18:15

"""
temp.py
"""

import requests, getpass, json

__author__ = "Toran Sahu <toran.sahu@yahoo.com>"
__license__ = "Distributed under terms of the MIT license"

url = "https://api.github.com/user/repos"
content = json.dumps({"name": "post-linux-install", "private": False})
username = "toransahu"
res = requests.post(url, content, auth=(username, getpass.getpass("Password: ")))
# print(res.status_code)
print(eval(res.text)["message"])
