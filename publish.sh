#!/bin/sh
set -e
set -o pipefail

WORKING_DIRECTORY="$PWD"

[ "$GITHUB_PAGES_REPO" ] || {
  #https://user:MYTOKEN@github.com/user/helm-charts.git
  echo "ERROR: Environment variable GITHUB_PAGES_REPO is required"
  #exit 1
}

[ "$GITHUB_USER" ] || {
  echo "ERROR: Environment variable GITHUB_USER is required"
  #exit 1
}

[ -z "$GITHUB_PAGES_BRANCH" ] && GITHUB_PAGES_BRANCH=gh-pages

[ -z "$HELM_VERSION" ] && HELM_VERSION=2.12.0

helm () {
  echo ">>>> helm $@"
  (docker run --rm -v $(pwd):/apps alpine/helm:$HELM_VERSION "$@")
}

gitt() {
  docker run \
    --rm \
    -e GITHUB_PAGES_REPO=$GITHUB_PAGES_REPO \
    -e GITHUB_USER=$GITHUB_USER \
    -e GITHUB_PAGES_BRANCH=$GITHUB_PAGES_BRANCH \
    -v $(pwd):/tmp/work/ \
    --entrypoint=/bin/sh \
    alpine/git -c '\
      cd /tmp/work; \
      git config user.email "$GITHUB_USER@users.noreply.github.com"; \
      git config user.name $GITHUB_USER; \
      $@
    '
}

build () {
  echo '>> Building charts...'
  find . -name Chart.yaml | while read chart; do
    chart_name="`dirname "$chart"`"

    helm lint $chart_name

    mkdir -p "out/$chart_name"
    helm package --save=false -d "out/$chart_name" "$chart_name"
  done
  helm repo index out
}

publish () {
  echo ">> Publishing to $GITHUB_PAGES_BRANCH branch of $GITHUB_PAGES_REPO"
  git checkout "$GITHUB_PAGES_BRANCH"
  git pull --rebase origin $GITHUB_PAGES_BRANCH
  cp -an ./out/* ./
  git add .
  git commit -m "Chart sync"
  git push origin "$GITHUB_PAGES_BRANCH"
  git checkout master
}

build
publish
