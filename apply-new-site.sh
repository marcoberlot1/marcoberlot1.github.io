#!/usr/bin/env bash
# Run this from the ROOT of your local marcoberlot1.github.io git clone,
# with new-site-files.zip downloaded into that same folder.
set -e

if [ ! -d ".git" ]; then
  echo "Run this from the root of your marcoberlot1.github.io git clone (no .git dir found here)."
  exit 1
fi
if [ ! -f "new-site-files.zip" ]; then
  echo "Put new-site-files.zip in this folder first."
  exit 1
fi

echo "Removing the previous version of these files..."
rm -rf assets blog
rm -f index.html 404.html .github/workflows/deploy.yml

echo "Unpacking the current site..."
unzip -o new-site-files.zip -d .

echo ""
echo "Done. Review with 'git status', then:"
echo "  git add -A"
echo "  git commit -m 'Redesign: ink-and-paper style, new avatar work, Essays category'"
echo "  git push"
echo ""
echo "This pushes to whatever branch you're currently on locally, make sure that's"
echo "'master' (the repo's default branch) before committing, or the deploy"
echo "workflow won't pick it up."
