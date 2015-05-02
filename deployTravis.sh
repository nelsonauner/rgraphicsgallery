echo ${GH_TOKEN}
echo ${GH_REF}
git status
git config user.name "Travis-CI"
git config user.email "travis@nelsonauner.com"
git add --all
git status
git commit -m 'travis deployment to github pages'
git status
git push --verbose "https://nelsonauner:${GH_TOKEN}@${GH_REF}" master
