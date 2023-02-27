# Release process

When releasing consider the following steps:

- Clone the main repository `git clone https://github.com/mgiessing/opence-container-build`
- Checkout a new branch `git checkout -b <version>-branch`
- Edit README.md and enter new information in the compat matrix (+ anything else what's new)
- Edit build.sh and update OPENCE_VERSION (+ Python if necessary)
- Edit Makefile and update OPENCE_VERSION + Python (optional because overriden by build.sh)
- Edit / update image versions in deployment yamls
- Add, commit and push upstream (`git add -A`, `git commit -sm "Releasing for <>"`, `git push --set-upstream origin v<version>-branch`)
- Merge the branch into main
- Release via UI