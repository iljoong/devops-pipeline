# Azure DevOps pipeline sample

## Features

- Multi-stage pipeline
- Multi-job/pool
- Parallel execution
- Template pipeline: build.yml, deploy.yml
- Condition: linux, windows
- Multi-pipelines (trigger by pipeline completion)
- Publish/download pipeline artifact

## Samples

1. Multi-stage pipeline

    ![pipeline](./pipeline.png)
    [azure-pipeline.yaml](./pipelines/azure-pipline.yml)

2. Multi-pipelines (trigger by pipeline completion)

    [[pipeline01.yml](./pipelines/pipeline01.yaml)]->[[pipline02.yml](./pipelines/pipeline02.yaml)]

## Documentation

- https://docs.microsoft.com/en-us/azure/devops/pipelines/get-started/key-pipelines-concepts?view=azure-devops
- Multi-repos: https://docs.microsoft.com/en-us/azure/devops/pipelines/repos/multi-repo-checkout?view=azure-devops
- Trigger: https://docs.microsoft.com/en-us/azure/devops/pipelines/process/pipeline-triggers?view=azure-devops
- Predefined variables: https://docs.microsoft.com/en-us/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml