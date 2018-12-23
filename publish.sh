#!/bin/sh
set -e
set -o pipefail

[ -z "$GITHUB_PAGES_BRANCH" ] && GITHUB_PAGES_BRANCH=gh-pages

[ -z "$HELM_VERSION" ] && HELM_VERSION=2.12.0

helm () {
  echo ">>>> helm $@"
  (docker run --rm -v $(pwd):/apps alpine/helm:$HELM_VERSION "$@")
}

build () {
  echo '>> Building charts...'
  find . -name Chart.yaml | while read chart; do
    chart_name="`dirname "$chart"`"

    helm lint $chart_name

    mkdir -p "out/$chart_name"
    helm package --save=false -d "out/$chart_name" "$chart_name"
  done
}

publish () {
  echo ">> Publishing to $GITHUB_PAGES_BRANCH"
  git checkout "$GITHUB_PAGES_BRANCH"
  git pull --rebase origin $GITHUB_PAGES_BRANCH
  cp -an ./out/* ./
  helm repo index .
  git add .
  git commit -m "Chart sync"
  git push origin "$GITHUB_PAGES_BRANCH"
  git checkout master
}

build
publish
