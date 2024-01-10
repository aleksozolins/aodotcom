#!/bin/sh

rm -rf build/*
emacs -Q --script build-site.el
