set -o errexit -o nounset
rev=$(git rev-parse --short HEAD)
git init
git config user.name "Travis-CI"
git config user.email "travis@nelsonauner.com"
git remote add upstream "https://nelsonauner:${GH_TOKEN}@${GH_REF}"
git fetch upstream 
git reset upstream/gh-pages
echo ${GH_TOKEN}
echo ${GH_REF}
git add -A .
git commit -m "travis deploy to gh-pages ${rev}"
git push -q upstream HEAD:gh-pages
