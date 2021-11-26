#!/usr/bin/make -f

MAKEFLAGS += -Rr --warn-undefined-variables
SHELL != which bash
.SHELLFLAGS := -euo pipefail -c

.ONESHELL:
.DELETE_ON_ERROR:
.PHONY: phony
.DEFAULT_GOAL := main

tmp := tmp/fib

hosts := tst2 tst4 tst5 tst6 tst8
hosts_avail := $$(while [[ -z `for i in $(hosts); do if ! pgrep -f "ssh $i" -c &>/dev/null ; then echo -n "$i "; fi ; done` ]] ; do echo "no host available"; sleep 2; done )
host := $$(shuf -n 1 -e $(hosts_avail))

fib := fib () { echo "define fib (n) { if (n <= 2) return 1; return fib(n - 1) + fib(n - 2) }; fib($${1:?})" | bc -ql; }

$(tmp)/%: | $(tmp); @ echo -n $* ""; $(fib); { declare -f fib; echo fib $*; } | ssh $(host).admin2 bash > $@
$(tmp):; mkdir $@

nfibs ?= 33
fibs != seq -w $(nfibs)
main: phony $(fibs:%=$(tmp)/%); @ echo; echo -n $$(cat $(tmp)/*)

clean: phony; rm -r $(tmp)
