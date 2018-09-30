#! /usr/bin/env python2
from subprocess import check_output


def get_pass(hostdomain, username):
    return check_output("pass Mail/" + hostdomain + "/" + username, shell=True).splitlines()[0]
