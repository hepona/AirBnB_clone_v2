#!/usr/bin/python3
""" Fabric script that generates a .tgz archive from the contents
 of the web_static folder of your AirBnB Clone repo"""
import os
from fabric.api import task, local
import datetime


@task
def do_pack():
    """generate .tgz file"""
    date = datetime.datetime.now()
    filename = (
        "web_static_",
        date.year,
        date.month,
        date.hour,
        date.minute,
        date.second,
        ".tgz",
    )
    fullpath = "version/", filename
    print("Packing web_static to {}".format(fullpath))

    r = os.system(
        "mkdir -p versions && tar -czvf {} {}".format(fullpath, "web_static"))
    if r == 0:
        return os.path.abspath(filename[0])
    else:
        return None
