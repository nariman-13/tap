Start the app deployment by running:

tanzu apps workload create tanzu-java-web-app \
  --file ./config/workload.yaml \
  --local-path . \
  --source-image "${SOURCE_IMAGE}"
