#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
# created_on: 2018-11-12 18:15

"""
.gitrepo.py
"""

import sys
import requests
import getpass
import json


__author__ = "Toran Sahu <toran.sahu@yahoo.com>"
__license__ = "Distributed under terms of the MIT license"


def grepo():
    url = "https://api.github.com/user/repos"

    content = json.dumps({"name": sys.argv[-1], "private": False})
    username = "toransahu"
    res = requests.post(url, content, auth=(username, getpass.getpass("Password: ")))
    print("Status:", res.status_code)

if __name__ == "__main__":
    grepo()
