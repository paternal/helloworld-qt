#!/usr/bin/env python3

"""Installateur"""

from setuptools import setup, find_packages

setup(
    name="helloworld-qt",
    version="1.0.0",
    packages=find_packages(),
    install_requires=["PyQt5>=5.10"],
    include_package_data=True,
    #author=AUTHOR,
    #author_email=AUTHOR_EMAIL,
    description="'Hello world' in QT",
    #license="GPLv2",
    entry_points={
        "gui_scripts": ["helloworld-qt = helloworldqt.__main__:main"],
        #"console_scripts": ["helloworld-qt = helloworldqt.__main__:main"],
    },
    #long_description=readme(),
    #long_description_content_type="text/markdown",
    zip_safe=True,
)
