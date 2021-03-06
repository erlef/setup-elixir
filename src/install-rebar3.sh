#!/bin/bash

set -eo pipefail

cd "$RUNNER_TEMP"

VSN=${1}
FILE_INPUT=rebar3
FILE_OUTPUT=rebar3
DIR_FOR_BIN=.setup-beam/rebar3

wget -q -O "${FILE_OUTPUT}" "https://github.com/erlang/rebar3/releases/download/${VSN}/${FILE_INPUT}"
mkdir -p "${DIR_FOR_BIN}/bin"
chmod +x "${FILE_OUTPUT}"
mv "${FILE_OUTPUT}" "${DIR_FOR_BIN}/bin"
echo "Installed rebar3 version follows"
${DIR_FOR_BIN}/bin/rebar3 version
