#!/usr/bin/env bash -ex

cd $(dirname $0)

yarn

pushd tdd
    npx showdown \
	    makehtml \
	    -i tdd.md \
	    -o content.mustache

    jq -n \
        --arg title tdd \
        '{title: $title}' \
    | npx mustache \
        -p content.mustache \
        - \
        ../base.mustache \
        > index.html
popd

pushd pairing
    npx showdown \
	    makehtml \
	    -i pairing_and_mobbing.md \
	    -o content.mustache

    jq -n \
        --arg title pairing \
        '{title: $title}' \
    | npx mustache \
        -p content.mustache \
        - \
        ../base.mustache \
        > index.html
popd

pushd stories
    npx showdown \
	    makehtml \
	    -i stories.md \
	    -o content.mustache

    jq -n \
        --arg title stories \
        '{title: $title}' \
    | npx mustache \
        -p content.mustache \
        - \
        ../base.mustache \
        > index.html
popd
