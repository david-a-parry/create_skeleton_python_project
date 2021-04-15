try:
    from setuptools import setup
except ImportError:
    from distutils.core import setup
import re
v_file = "PROJECT/version.py"
v_line = open(v_file, "rt").read()
v_re = r"^__version__ = ['\"]([^'\"]*)['\"]"
match = re.search(v_re, v_line, re.M)
if match:
    verstr = match.group(1)
else:
    raise RuntimeError("Unable to find version string in {}.".format(v_file))

setup(
    name="PROJECT",
    packages=["PROJECT"],
    version=verstr,
    description="TODO - Project description",
    author="YOURNAME",
    author_email="EMAIL",
    url='https://github.com/GITHUBUSER/PROJECT',
    download_url='https://github.com/GITHUBUSER/PROJECT/archive/{}.tar.gz'.format(verstr),
    license='MIT',
    install_requires=[],
    scripts=["bin/PROJECT"],
    include_package_data=True,
    classifiers=[
        "Programming Language :: Python :: 3",
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Intended Audience :: Science/Research",
        "License :: OSI Approved :: MIT License",
        "Topic :: Scientific/Engineering :: Bio-Informatics",
        ],
)
