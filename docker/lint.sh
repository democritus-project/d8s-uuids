#!/usr/bin/env bash

set -euxo pipefail

echo "Running linters and formatters..."

isort democritus_uuids/ tests/

black democritus_uuids/ tests/

mypy democritus_uuids/ tests/

pylint --fail-under 9 democritus_uuids/*.py

flake8 democritus_uuids/ tests/

bandit -r democritus_uuids/

# we run black again at the end to undo any odd changes made by any of the linters above
black democritus_uuids/ tests/
