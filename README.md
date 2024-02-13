# build-deploy-scaffold

## Images to be pulled to the ci namespace :

oc import-image rhel9-nodejs-16 --from=registry.redhat.io/rhel9/nodejs-16 --confirm
oc import-image ubi --from=registry.access.redhat.com/ubi8/ubi:latest --confirm
oc import-image buildah --from=registry.redhat.io/rhel8/buildah:latest --confirm
oc import-image terminal --from=quay.io/marrober/devex-terminal-4:full-terminal-1.5 --confirm