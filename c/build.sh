#!/usr/bin/env bash

FLAGS=" -Wall -Wpedantic -Wextra"
FLAGS="$FLAGS -Wno-gnu-zero-variadic-macro-arguments -Wno-unused-function"
FLAGS="$FLAGS -Werror=implicit-function-declaration"

MATH=" -lm"

DBG_FLAGS=" "

FILES=(main.c pool/pool.c utils/args_parser.c random/random.c tracker/tracker.c pool/deque.c actions/actions.c utils/progress.c)

CC=clang
# CC=gcc

mkdir -p build

$CC $FLAGS $DBG_FLAGS ${FILES[@]} -o build/c-test $MATH $*