# Ridge Racer 64 Decompilation project
An attempt on Decompiling RR64

## Requirements
- Programs
    - Python 3 (Tested on 3.13)
    - mips-linux-gnu-binutils 2.44
    - CMake, for building armips
    - gcc
    - wget
    - make
- Files
    - A copy of the USA release of Ridge Racer 64 ``(md5: 990f97d56456fc23e52bd263e709e21e)``

- Cloning options
    - Remember to use the flag ``--recurse-submodules`` when cloning. Otherwise, run ``git submodule update --init --recursive`` after cloning

## Building
Place your copy of the original rom in the root folder of this repository and name it ``baserom.z64``

Create a python virtual environment with ``python3 -m venv .venv``. Then, activate it with ``source .venv/bin/activate`` and install the required packages with ``python3 -m pip install requirements.txt``

With the python virtual environment active, run ``make all`` to configure and build the tools (only the first time), run splat and generate a new ROM in ``build/ridgeracer64.z64``.

To run `splat` without building a new ROM, run `make split`