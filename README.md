[![Docker](https://github.com/adeslatt/samtools-docker/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/adeslatt/samtools-docker/actions/workflows/docker-publish.yml)
# samtools-docker
## Samtools build done with v1.15.1

In this case, the conda install does not work -- instead, this Dockerfile gets the release.

[Samtools](http://www.htslib.org/download/)

Steps to build this docker container.
1. Determine the dependencies by iterative running of .configure
2. Use ubuntu base image
3. get each of the dependencies
4. run the steps specified for [building and installing](http://www.htslib.org/download/)

To edit the files:
1. Use a simple editor (Text Edit on Mac is fine) - we want to be cautious about unseen characters
2. Use emacs (can be installed with conda)
```bash
conda install -c conda forge emacs
```

To build your image from the command line:
* Can do this on [Google shell](https://shell.cloud.google.com) - docker is installed and available

```bash
docker build -t samtools .
```

To test this tool from the command line 

Set up an environment variable capturing your current command line:
```bash
PWD=$(pwd)
```

Then mount and use your current directory and call the tool now encapsulated within the environment.

Any samtools command can be used to check.

```bash
docker run -it -v $PWD:$PWD -w $PWD samtools samtools fastq
```

Using this published release we have to follow the instructions to authenticate with GitHub by using your GitHub token. [Authenticating to the Container Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry)

1.  Create your own personal access token
2.  set an environment variable to your token
```bash
export CR_PAT=Your_Token
```
4.  Then on the command line you can 
```bash
 echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin
 ```
 
 Then you can use the command to pull the image from the GitHub repository.
 
 
