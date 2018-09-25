#!/bin/sh
# Peng Gu
# 09/23/2018
# diskhog.sh
# This file displays the 5 largest items (files or folders) in the current directory in decreasing order of size, and makes the sizes readable

du -hs * | sort -h -r | head -5
