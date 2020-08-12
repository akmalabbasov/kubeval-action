# Kubeval

A [GitHub Action](https://github.com/features/actions) for using [Kubeval](https://github.com/instrumenta/kubeval) in your workflows.

You can use the action as follows:

```yaml
on: push
name: Validate
jobs:
  kubeval:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: test
      uses: akmalabbasov/kubeval-action@master
```

By default the action will recursively scan for YAML files and validate them as Kubernetes obejcts. You can configure this with the parameters.

The Kubeval Action has a number of properties which map to the parameters for Kubeval itself. These are
passed to the action using `with`.

| Property | Default | Description |
| --- | --- | --- |
| directories | . | A comma-separated list of directories to recursively search for YAML documents |
| ignore_missing_schemas | true | Skip validation for resource definitions without a schema |
| ignored_filename_patterns | "" | A comma-separated list of regular expressions specifying filenames to ignore |
| kubernetes_version | master | Version of Kubernetes to validate against |
| openshift | false | Whether to use the schemas from OpenShift rather than Kubernetes |
| output | stdout | The format of the output of this script. Options are: [stdout json tap] |
| strict | true | Disallow additional properties not in schema |
