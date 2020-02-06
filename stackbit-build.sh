#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e3c68279bf6f2001b6c2263/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e3c68279bf6f2001b6c2263
curl -s -X POST https://api.stackbit.com/project/5e3c68279bf6f2001b6c2263/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e3c68279bf6f2001b6c2263/webhook/build/publish > /dev/null
