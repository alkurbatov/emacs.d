#!/bin/bash

set -eux


# Settings.
EMACS_HOME=~/.emacs.d


# Purge previous configuration.
if [ -d "${EMACS_HOME}" ]; then
    for i in lisp snippets; do
        rm -rf "${EMACS_HOME:?}/${i}" || true
    done

    rm "${EMACS_HOME}"/init.el || true
else
    mkdir "${EMACS_HOME}"
fi


# Install new configuration.
cp init.el "${EMACS_HOME}"

for i in lisp snippets; do
    cp -r "${i}" "${EMACS_HOME}"
done
