#!/bin/sh

export OPENSHIFT_CLUSTER_INFO=$(oc cluster-info | head -n 1 | sed 's/^.https...api//' | sed 's/.6443.$//')
export K8S_CLUSTER_API=$(oc cluster-info | head -n 1 |  sed 's/^.*https/https/')
export RHDH_ROUTE=$(oc get route/redhat-developer-hub -o=jsonpath='{"https://"}{.spec.host}')

export GITHUB_HOST_DOMAIN='github.com'
export GITHUB_ORGANIZATION='marrober'
export GITHUB_ORG_URL=https://$GITHUB_HOST_DOMAIN/$GITHUB_ORGANIZATION

export GITHUB_APP_ID=''
export GITHUB_APP_CLIENT_ID=''
export GITHUB_APP_CLIENT_SECRET=''
export GITHUB_APP_PRIVATE_KEY_FILE="rhdh-rhpds.2024-07-09.private-key.pem"

export GITHUB_APP_WEBHOOK_URL=$RHDH_ROUTE
export GITHUB_APP_WEBHOOK_SECRET=''

oc create secret generic rhdh-secrets --from-literal=GITHUB_ORG_URL=$GITHUB_ORG_URL --from-literal=GITHUB_APP_ID=$GITHUB_APP_ID --from-literal=GITHUB_APP_CLIENT_ID=$GITHUB_APP_CLIENT_ID --from-literal=GITHUB_APP_CLIENT_SECRET=$GITHUB_APP_CLIENT_SECRET --from-file=GITHUB_APP_PRIVATE_KEY_FILE=$GITHUB_APP_PRIVATE_KEY_FILE --from-literal=GITHUB_APP_WEBHOOK_URL=$GITHUB_APP_WEBHOOK_URL --from-literal=GITHUB_APP_WEBHOOK_SECRET=$GITHUB_APP_WEBHOOK_SECRET --from-literal=RHDH_BASE_URL=$RHDH_ROUTE

