FROM tacc/tacc-ml:centos7-cuda10-tf2.4-pt1.7

# Install Transformers library
RUN conda install -q --yes --no-update-deps -c conda-forge \
    transformers \
    seaborn

# Install torchtext library
RUN conda install -q --yes --no-update-deps -c pytorch \
    torchtext 

WORKDIR /code

ENV PATH=/code:$PATH

COPY test.csv train.csv valid.csv /code/ 
COPY bert_classifier.py /code
RUN chmod +x /code/bert_classifier.py
