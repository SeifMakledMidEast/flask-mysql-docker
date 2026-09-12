#!/usr/bin/env sh

set -eu

trivy_image="aquasec/trivy:0.56.2"
trivy_args="--scanners vuln --severity HIGH,CRITICAL --ignore-unfixed --exit-code 1 --no-progress"

scan_image() {
  image="$1"
  docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v trivy-cache:/root/.cache \
    "$trivy_image" image $trivy_args "$image"
}

scan_status=0
scan_image flask-mysql-app:local || scan_status=$?
scan_image flask-mysql-db:local || scan_status=$?

exit "$scan_status"