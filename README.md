<div align="center">
  <h1>pipenv-tox</h1>
</div>

<div align="center">
  <a href="https://opensource.org/licenses/MIT"><img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-brightgreen.svg"></a>
  <a href="https://github.com/edesz/pipenv-tox/pulls"><img alt="PRs Welcome" src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square"></a>
  <a href="https://github.com/edesz/pipenv-tox/actions">
    <img src="https://github.com/edesz/pipenv-tox/workflows/CI/badge.svg"/>
  </a>
  <a href="https://github.com/edesz/pipenv-tox/actions">
    <img src="https://github.com/edesz/pipenv-tox/workflows/CodeQL/badge.svg"/>
  </a>
  <a href="https://en.wikipedia.org/wiki/Open-source_software"><img alt="Open Source?: Yes" src="https://badgen.net/badge/Open%20Source%20%3F/Yes%21/blue?icon=github"></a>
  <a href="https://pyup.io/repos/github/edesz/pipenv-tox/"><img src="https://pyup.io/repos/github/edesz/pipenv-tox/shield.svg" alt="Updates" /></a>
</div>
<div align="center">
  <a href="https://www.codacy.com/gh/edesz/pipenv-tox/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=edesz/pipenv-tox&amp;utm_campaign=Badge_Grade"><img src="https://app.codacy.com/project/badge/Grade/c6c87007799f4af48f915035c15e3745"/></a>
  <a href="https://wakatime.com/badge/github/edesz/pipenv-tox.svg"><img alt="wakatime" src="https://wakatime.com/badge/github/edesz/pipenv-tox.svg"/></a>
</div>

## About
This is a simple example of using the Python packages [`tox`](https://tox.readthedocs.io/en/latest/) and [`pipenv`](https://docs.pipenv.org/) together.

Here, `tox` defines the virtual environments but, for all `virtualenv`s, Python dependencies are specified in `requirements.txt` and are handled by `pipenv`.

## Notes
1. The `virtualenv`'s dependencies are only specified by
   - [`tox`'s `deps` variable](https://tox.readthedocs.io/en/latest/example/basic.html#depending-on-requirements-txt-or-defining-constraints)
     - this is [set to the value `pipenv`](https://pipenv.kennethreitz.org/en/latest/advanced/#tox-automation-project)

This means that no dependencies are manually assigned by `tox`'s `deps` instruction.

## Usage
 1. Run a script in `tox` environment named `one`
 
    ```bash
    make one
     ```
 2. Run a script in `tox` environment named `tests`
 
    ```bash
    make tests
     ```
 3. Clean up
 
    ```bash
    make clean
    ```
 4. Run all `make` targets together with
 
    ```bash
    make one tests clean
    ```
    which produces the following output

    ```bash
    + one
    one create: /home/<username>/Downloads/pipenv-tox/.tox/one
    one installdeps: pipenv
    one installed: appdirs==1.4.4,certifi==2020.12.5,distlib==0.3.1,filelock==3.0.12,pipenv==2020.11.15,six==1.15.0,virtualenv==20.4.2,virtualenv-clone==0.5.4
    one run-test-pre: PYTHONHASHSEED='4030087076'
    one run-test: commands[0] | pipenv install -r /home/<username>/Downloads/pipenv-tox/requirements.txt
    Requirements file provided! Importing into Pipfile...
    Pipfile.lock not found, creating...
    Locking [dev-packages] dependencies...
    Locking [packages] dependencies...
    Building requirements...
    Resolving dependencies...
    ✔ Success! 
    Updated Pipfile.lock (6642f0)!
    Installing dependencies from Pipfile.lock (6642f0)...
    🐍   ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 20/20 — 00:00:05
    one run-test: commands[1] | pipenv run one
    Loading .env environment variables...
             0
    0  0.710434
    1  0.497878
    2  0.373428
    3  0.972169
    4  0.845695
    5  0.495674
    6  0.024804
    7  0.040575
    8  0.395333
    9  0.091002
    1
    __________________________________________ summary ___________________________________________
    one: commands succeeded
    congratulations :)
    + tests
    tests create: /home/<username>/Downloads/pipenv-tox/.tox/tests
    tests installdeps: pipenv
    tests installed: appdirs==1.4.4,certifi==2020.12.5,distlib==0.3.1,filelock==3.0.12,pipenv==2020.11.15,six==1.15.0,virtualenv==20.4.2,virtualenv-clone==0.5.4
    tests run-test-pre: PYTHONHASHSEED='3978051256'
    tests run-test: commands[0] | pipenv install -r /home/<username>/Downloads/pipenv-tox/requirements_test.txt
    Requirements file provided! Importing into Pipfile...
    Installing dependencies from Pipfile.lock (6642f0)...
    🐍   ▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉ 20/20 — 00:00:05
    tests run-test: commands[1] | coverage run -m pytest
    ==================================== test session starts =====================================
    platform linux -- Python 3.8.5, pytest-6.2.2, py-1.10.0, pluggy-0.13.1
    cachedir: /home/<username>/Downloads/pipenv-tox/.tox/tests/.pytest_cache
    rootdir: /home/<username>/Downloads/pipenv-tox/src
    collected 1 item                                                                            
    tests/test_main.py .                                                                  [100%]
     ===================================== 1 passed in 0.25s ======================================
    tests run-test: commands[2] | coverage report -m
    Name     Stmts   Miss  Cover   Missing
    --------------------------------------
    app.py       5      0   100%
    --------------------------------------
    TOTAL        5      0   100%
    tests run-test: commands[3] | coverage html
    __________________________________________ summary ___________________________________________
    tests: commands succeeded
    congratulations :)
    + clean
    .
    ├── abc.py
    ├── Makefile
    ├── Pipfile
    ├── README.md
    ├── requirements_test.txt
    ├── requirements.txt
    ├── src
    │   ├── app.py
    │   ├── __init__.py
    │   ├── main.py
    │   └── tests
    │       ├── __init__.py
    │       └── test_main.py
    └── tox.ini
    2 directories, 12 files
    ```
