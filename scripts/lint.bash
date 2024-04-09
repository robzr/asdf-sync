#!/usr/bin/env bash

shellcheck --shell=bash --external-sources \
  bin/* --source-path=template/lib/ \
  lib/*.bash \
  lib/commands/*.bash \
  scripts/* \
  asdf-sync

shfmt --language-dialect bash -i 2 --diff \
  asdf-sync ./**/*
