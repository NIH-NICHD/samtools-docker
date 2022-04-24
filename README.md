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
