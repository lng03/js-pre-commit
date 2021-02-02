from setuptools import setup

setup(
    name='js-pre-commit',
    version='0.1.0',
    # packages=find_packages(include=['exampleproject', 'exampleproject.*']),
    install_requires=[
        'black',
        'flake8'
    ]
)