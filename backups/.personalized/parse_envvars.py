#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
# created_on: 2020-02-04 15:31

"""Parse Envvars."""

import os
import argparse
from gettext import gettext as _


__author__ = 'Toran Sahu <toran.sahu@yahoo.com>'
__license__ = 'Distributed under terms of the MIT license'


WORKSPACE = os.environ["WORKSPACE"]
ROOT_ENV = os.path.join(WORKSPACE, "secret")
ENV = "envs"


class ParseKeyVal(argparse.Action):
    """ParseKeyVal parses key value pair in dict format."""
    def __init__(self, option_strings, dest, nargs=None, **kwargs):
        super(ParseKeyVal, self).__init__(option_strings, dest, **kwargs)

    def __call__(self, parser, namespace, values, option_string=None):
        namespace.kv = dict()
        try:
            k, v = values.split('=')
            namespace.kv[k] = v
        except ValueError:
            print("Error while parsing key-val pair %s" % values)


def get_common_parser():
    parser = argparse.ArgumentParser(description=_("Save an ENV var"))
    parser.add_argument(
        "-c", "--ctx", help=_("Context")  # TODO: default me
    )
    parser.add_argument(
        "-e", "--env", help=_("Environment")  # TODO: for me
    )
    parser.add_argument(
        "--cmd", help=_("Command: var/unvar")
    )
    return parser


def var():
    parser = get_common_parser()
    parser.add_argument("kv", nargs=1, action=ParseKeyVal, help=_("key=value pair"))
    args = parser.parse_args()
    org = str(args.ctx).lower()
    full_env = str(args.env).lower()
    env, provider = None, None
    try:
        env, provider = full_env.split('@')
    except ValueError:
        env = full_env
        provider = None
    cmds = []
    for k, v in args.kv.items():
        k = "_".join([o.upper() for o in [k, org, env, provider] if o is not None])
        cmds.append("export %s=%s\n" % (k, v))
    org_env_dir = os.path.join(ROOT_ENV, org, ENV)
    alias_file = '.' + org + '_local_aliases'
    alias_file_path = os.path.join(org_env_dir, alias_file)
    with open(alias_file_path, "a+") as f:
        for cmd in cmds:
            f.write(cmd)


def unvar():
    pass


if __name__ == "__main__":
    var()
