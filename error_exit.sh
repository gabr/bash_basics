#!/bin/bash

PROGNAME=$(basename $0)

error_exit()
{
  echo "${PROGNAME}: ${1:-"UNKNOW ERROR"}" 1>&2
  exit 1
}

error_exit "$LINENO: AN error has occurred."
