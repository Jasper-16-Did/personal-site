#!/usr/bin/env bash
# deploy.sh — build and push _site/ to the Codeberg Pages branch
set -euo pipefail

PAGES_BRANCH="pages"

echo "==> Building site..."
bundle exec jekyll build

echo "==> Deploying to branch: $PAGES_BRANCH"

# Stash any uncommitted changes on the current branch
CURRENT_BRANCH=$(git symbolic-ref --short HEAD)

# Create a temporary directory and copy _site contents
TMPDIR=$(mktemp -d)
cp -r _site/. "$TMPDIR/"

# Switch to pages branch (create it if it doesn't exist)
if git show-ref --quiet refs/heads/$PAGES_BRANCH; then
  git checkout $PAGES_BRANCH
else
  git checkout --orphan $PAGES_BRANCH
  git rm -rf . --quiet
fi

# Replace all content with fresh build output
git rm -rf . --quiet 2>/dev/null || true
cp -r "$TMPDIR/." .
rm -rf "$TMPDIR"

# Commit and push
git add -A
git commit -m "Deploy $(date '+%Y-%m-%d %H:%M')"
git push origin $PAGES_BRANCH

# Return to source branch
git checkout "$CURRENT_BRANCH"

echo "==> Done. Site deployed to branch '$PAGES_BRANCH'."
echo "    It will be live at https://jaxond.me once DNS is configured."
