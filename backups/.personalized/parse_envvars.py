#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
# created_on: 2020-02-04 15:31

"""Parse Envvars."""

import argparse
import os
from gettext import gettext as _

__author__ = "Toran Sahu <toran.sahu@yahoo.com>"
__license__ = "Distributed under terms of the MIT license"


WORKSPACE = os.environ["ME"]
ROOT_ENV = os.path.join(WORKSPACE, "aliases")
ENV = "envs"
SELF = "self"


class ParseKeyVal(argparse.Action):
    """ParseKeyVal parses key value pair in dict format."""

    def __init__(self, option_strings, dest, nargs=None, **kwargs):
        super(ParseKeyVal, self).__init__(option_strings, dest, **kwargs)

    def __call__(self, parser, namespace, values, option_string=None):
        namespace.kv = dict()
        try:
            k, v = values.split("=")
            namespace.kv[k] = v
        except ValueError:
            pass


class EnvParser:
    def __init__(self):
        parser = argparse.ArgumentParser(description=_("Save an ENV var"))
        parser.add_argument("-c", "--ctx", default=SELF, help=_("Context"))  # TODO: default me
        parser.add_argument("-e", "--env", help=_("Environment"))  # TODO: for me
        parser.add_argument("--cmd", help=_("Command: var/unvar"))
        parser.add_argument("kv", nargs="*", action=ParseKeyVal, help=_("key=value pair"))
        parser.add_argument("k", nargs="*", help=_("keys to be actioned"))
        args = parser.parse_args()
        full_env = args.env

        self.org = str(args.ctx).lower()
        self.env, self.provider = None, None
        if full_env:
            full_env = str(args.env).lower()
            try:
                self.env, self.provider = full_env.split("@")
            except ValueError:
                self.env = full_env
                self.provider = None

        self.alias_file = "." + self.org + "_pvt_rc"
        self.alias_file_path = os.path.join(ROOT_ENV, self.alias_file)

        self.cmd_name = args.cmd
        self.cmds = []

        def KEY(k):
            suffix_list = [self.org, self.env, self.provider] if self.org != SELF else []
            return "_".join([o.upper() for o in [k] + suffix_list if o is not None])

        for k, v in args.kv.items():
            self.cmds.append("export %s=%s\n" % (KEY(k), v))

        for k in list(args.k):
            self.cmds.append("export %s=\n" % KEY(k))

        self._run()

    def _run(self):
        if self.cmd_name == "var":
            self.var()
        elif self.cmd_name == "unvar":
            self.unvar()

    def var(self):
        with open(self.alias_file_path, "a+") as f:
            for cmd in self.cmds:
                f.write(cmd)  # not handling duplicates for performance

    def unvar(self):
        with open(self.alias_file_path, "r") as f:
            lines = f.readlines()
        with open(self.alias_file_path, "w") as f:
            for line in lines:
                for cmd in self.cmds:
                    if cmd not in line:
                        f.write(line)


if __name__ == "__main__":
    EnvParser()
