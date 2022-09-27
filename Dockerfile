FROM tacc/tacc-ml:centos7-cuda10-tf2.4-pt1.7

# Install Transformers library
RUN conda install -q --yes --no-update-deps -c conda-forge \
    transformers=4.16.2 \
    seaborn=0.11.2

# Install torchtext library
RUN conda install -q --yes --no-update-deps -c pytorch \
    torchtext=0.8.0

WORKDIR /code

ENV PATH=/code:$PATH

COPY test.csv train.csv valid.csv /code/ 
COPY bert_classifier.py /code
RUN chmod +x /code/bert_classifier.py
