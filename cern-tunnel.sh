#!/bin/bash

# Dynamic SSH tunnel to route my web traffic through CERN
# Useful for hosts which are only accessible from inside CERN
ssh -D 9000 -C -N -v USER@HOST.cern.ch
