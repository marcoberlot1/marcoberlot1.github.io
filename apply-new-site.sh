#!/usr/bin/env bash
# Run this from the ROOT of your local personal-blog git clone,
# with new-site-files.zip downloaded into that same folder.
set -e

if [ ! -d ".git" ]; then
  echo "Run this from the root of your personal-blog git clone (no .git dir found here)."
  exit 1
fi
if [ ! -f "new-site-files.zip" ]; then
  echo "Put new-site-files.zip in this folder first."
  exit 1
fi

echo "Removing old Hugo scaffolding..."
rm -rf archetypes content public resources static themes assets
rm -f .gitmodules .hugo_build.lock .DS_Store config.yaml .github/workflows/hugo.yaml

echo "Unpacking new site files..."
unzip -o new-site-files.zip -d .

echo ""
echo "Done. Review with 'git status', then:"
echo "  git add -A"
echo "  git commit -m 'Rebuild site: static portfolio + blog, drop Hugo'"
echo "  git push"
echo ""
echo "Then in GitHub repo Settings > Pages, set Source to 'GitHub Actions' if it isn't already."
