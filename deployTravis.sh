git config user.name "Travis-CI"
git config user.email "travis@nelsonauner.com"
git commit -a -m 'travis deployment to github pages'
git push --quiet "https://nelsonauner:${GH_TOKEN}@${GH_REF}"
