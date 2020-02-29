#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
# created_on: 2020-02-29 01:04

"""Unique Last."""

import os
import shutil
import sys
from collections import OrderedDict
from datetime import datetime
from pathlib import Path  # >= Python 3.4

__author__ = "Toran Sahu <toran.sahu@yahoo.com>"
__license__ = "Distributed under terms of the MIT license"


NOW = datetime.now()
HISTFILE = os.environ.get("HISTFILE") or os.path.join(os.environ["HOME"], ".bash_history")
if not HISTFILE:
    print("HISTFILE not found at: %s" % HISTFILE)
    sys.exit(0)
HISTFILE_PATH = Path(HISTFILE)
HISTFILENAME = HISTFILE_PATH.name
HIST_BACKUP_DIR = os.path.join(HISTFILE_PATH.parent, ".hist_backup_dir")
HIST_BACKUP_FILE = os.path.join(HIST_BACKUP_DIR, HISTFILENAME + "." + NOW.strftime("%Y-%m-%d-%H:%M:%S") + ".bak")


def backup_hist_file():
    print("Backing up HISTFILE: %s" % HISTFILE)
    Path(HIST_BACKUP_DIR).mkdir(exist_ok=True)
    shutil.copy(HISTFILE, HIST_BACKUP_DIR)
    shutil.move(os.path.join(HIST_BACKUP_DIR, HISTFILENAME), HIST_BACKUP_FILE)


def get_lines_from_hist_file():
    with open(HISTFILE, "rb") as f:
        lines = f.readlines()
    return lines


def preprocess_cmd_lines(lines):
    mylines = []
    tmp = []

    for idx, line in enumerate(lines):
        try:
            line = line.decode("utf-8")
        except UnicodeDecodeError:
            print("Unicode issue at: Line: %s, Command: %s\nExiting.." % (idx + 1, line))
            sys.exit(0)

        if line.endswith("\\\\\n") or line.endswith("\\\n"):
            tmp.append(line)
        else:
            mylines.append("".join(tmp) + line)
            tmp = []

    return mylines


def get_last_uniques(lines):
    last_uniques = list(OrderedDict.fromkeys(lines[::-1]))[::-1]
    return last_uniques


def create_hist_file(lines):
    with open(HISTFILE, "w") as f:
        f.write("".join(lines))


if __name__ == "__main__":
    try:
        backup_hist_file()
        lines = get_lines_from_hist_file()
        preprocessed_lines = preprocess_cmd_lines(lines)
        last_uniques = get_last_uniques(preprocessed_lines)
        create_hist_file(last_uniques)
        print("Done!")
    except Exception as e:
        print("Something went wrong..\nExiting..")
        print(e)
        sys.exit(0)


# ref:
# - https://unix.stackexchange.com/questions/48713/how-can-i-remove-duplicates-in-my-bash-history-preserving-order
