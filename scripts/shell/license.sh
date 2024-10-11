#!/usr/bin/env bash

licenses="agpl-3.0\ngpl-3.0\nlgpl-3.0\nmpl-2.0\napache-2.0\nmit"
license=$(printf $licenses | fzf)

url="https://api.github.com/licenses/$license"

curl -s "$url" |  jq --raw-output '."body"'
