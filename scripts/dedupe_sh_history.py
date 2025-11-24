#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
# created_on: 2025-11-24 21:46

"""Dedupe History."""

import sys
import os


__author__ = 'Toran Sahu <toran.sahu@yahoo.com>'
__license__ = 'Distributed under terms of the MIT license'


# Read from HISTFILE
histfile = os.path.expanduser("~/.bash_history")

seen = set()
blocks = []
buf = []

def flush():
    if not buf:
        return
    block = "\n".join(buf)
    blocks.append(block)
    buf.clear()

with open(histfile) as f:
    for line in f:
        line = line.rstrip("\n")
        buf.append(line)
        # zsh multiline uses '\' at end OR literal newline as-is
        if not line.endswith("\\"):
            flush()

# flush last if needed
flush()

# Dedupe while keeping *last occurrence*
out = []
for block in reversed(blocks):
    if block not in seen:
        seen.add(block)
        out.append(block)

out.reverse()

# Write final cleaned history
with open(histfile + ".cleaned", "w") as f:
    for block in out:
        f.write(block + "\n")
