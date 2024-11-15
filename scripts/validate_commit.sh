#!/bin/sh

# Path to the commit message file
MSG_FILE="$1"

# Read the content of the commit message file
MSG=$(cat "$MSG_FILE")

# Regular expression to validate the commit message format
REGEX="^(feat|fix|docs|style|refactor|perf|test|chore|build|ci|revert|config)(\([a-zA-Z0-9_-]+\))?: .+"

# Extract the first line of the commit message
FIRST_LINE=$(echo "$MSG" | head -n1)

# Validate the commit message against the regex
if ! echo "$FIRST_LINE" | grep -qE "$REGEX"; then
  echo "ERROR: Your commit message does not comply with the Conventional Commits standard."
  echo "Please edit your commit message or use 'cz' to create a compliant commit."
  echo ""
  echo "Commit message format should follow:"
  echo "  type(scope): short description"
  echo ""
  echo "Where 'type' must be one of the following:"
  echo "  feat, fix, docs, style, refactor, perf, test, chore, build, ci, revert, config"
  echo ""
  echo "Examples of valid commit messages:"
  echo "  feat(parser): add array parsing support"
  echo "  fix(api): resolve authorization issue"
  exit 1
fi
