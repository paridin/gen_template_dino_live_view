#!/bin/bash
# Script to be run in CI and also locally, to simulate what CI will do, as a
# pre-PR final check

# Ensure that any failing command will exit this script
set -e

export MIX_ENV=test

# Run this first to fail fast
echo "Checking formatting"
mix format --check-formatted

# If actually running in CI
if [ "$CI" == "true" ]
then
  mix local.hex --force
  mix local.rebar --force
  mix deps.get
  mix ecto.create
  mix ecto.migrate
else
  echo "Skipping CI setup"
fi

# Other checks, from fastest to slowest
echo "Linting"
mix credo --strict
echo "Security check"
mix sobelow
echo "Checking for warnings"
mix compile --force --warnings-as-errors
echo "Running tests and checking coverage"
mix test --cover