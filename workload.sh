#!/bin/bash

# Define the TAP workload creation function
create_tap_workload() {
    name="$1"
    git_repo="$2"
    sub_path="$3"
    git_branch="$4"
    workload_type="$5"
    label="$6"
    namespace="$7"

    tanzu apps workload create "$name" \
        --git-repo "$git_repo" \
        --sub-path "$sub_path" \
        --git-branch "$git_branch" \
        --type "$workload_type" \
        --label "$label" \
        --yes \
        --namespace "$namespace"
}

# Set common parameters
git_repo="https://github.com/vmware-tanzu/application-accelerator-samples"
git_branch="main"
workload_type="web"
namespace="dev-ns-02"

# Create TAP workloads one after another
create_tap_workload "python-web-app" "$git_repo" "python-web-app" "$git_branch" "$workload_type" "app.kubernetes.io/part-of=tanzu-python-web-app" "$namespace"
create_tap_workload "tanzu-csharp-weatherforecast" "$git_repo" "csharp-weatherforecast" "$git_branch" "$workload_type" "app.kubernetes.io/part-of=tanzu-python-web-app" "$namespace"
create_tap_workload "tanzu-java-server-side-ui" "$git_repo" "java-server-side-ui" "$git_branch" "$workload_type" "app.kubernetes.io/part-of=tanzu-java-server-side-ui" "$namespace"
create_tap_workload "appsso-starter-java" "$git_repo" "appsso-starter-java" "$git_branch" "$workload_type" "app.kubernetes.io/part-of=appsso-starter-java" "$namespace"
create_tap_workload "node-express" "$git_repo" "node-express" "$git_branch" "$workload_type" "app.kubernetes.io/part-of=node-express" "$namespace"
