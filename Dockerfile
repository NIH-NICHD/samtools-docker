# Full contents of Dockerfile

FROM continuumio/miniconda3
LABEL description="Base docker image with conda and util libraries"
ARG ENV_NAME="samtools"

# Install the conda environment
# Unfortunately, as of 2022 April 24, conda install -c bioconda samtools does not work
#COPY environment.yml /
#RUN conda env create --quiet --name ${ENV_NAME} --file /environment.yml && conda clean -a
# Add conda installation dir to PATH (instead of doing 'conda activate')
#ENV PATH /opt/conda/envs/${ENV_NAME}/bin:$PATH

# need to get, configure and make samtools to have this docker work
RUN wget https://github.com/samtools/samtools/releases/download/1.15.1/samtools-1.15.1.tar.bz2 && \
    bzip2 -d samtools-1.15.1.tar.bz2 && \
    tar xvf samtools-1.15.1.tar && \
    cd samtools-1.15.1 && \
    ./configure && \
    make && \
    make install


