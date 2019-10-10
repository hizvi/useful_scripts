#!/bin/bash
## Simple venv management for python 3.
## activate virtual env if exists, create one otherwise.
## 
## USAGE: 
## source ${SCRIPT_PATH} VENV_NAME

VENV_DIR="$HOME/.venv"
PYTHON='/usr/bin/python3'

function _venv() {
    if [ ! -d "$VENV_DIR/$1" ] 
    then 
        echo "creating virtual environment $VENV_DIR/$1"
        $PYTHON -m venv "$VENV_DIR/$1"
    else
        echo "venv exists at \"$VENV_DIR/$1\""
        echo "activating virtual environment $1"
    fi 

    source "$VENV_DIR/$1/bin/activate"
} 

_venv $1