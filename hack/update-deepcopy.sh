#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

SCRIPT_ROOT=$(dirname ${BASH_SOURCE})/..
CODEGEN_PKG=${CODEGEN_PKG:-$(cd ${SCRIPT_ROOT}; ls -d -1 ./vendor/k8s.io/code-generator 2>/dev/null || echo ../../../k8s.io/code-generator)}

${CODEGEN_PKG}/generate-groups.sh "deepcopy" \
  github.com/openshift/api/generated \
  github.com/openshift/api \
  "apps:v1 authorization:v1 build:v1 image:v1 network:v1 oauth:v1 project:v1 quota:v1 route:v1 security:v1 template:v1 user:v1" \
  --go-header-file ${SCRIPT_ROOT}/hack/empty.txt
