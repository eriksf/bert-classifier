FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime

# Update pip
RUN pip install --upgrade pip

# Install needed libraries
RUN pip install \
    seaborn==0.11.2 \
    scikit-learn==0.24.2 \
    scipy==1.7.1 \
    tokenizers==0.20.3 \
    torchtext==0.8.1 \
    transformers==4.16.2

WORKDIR /code

ENV PATH=/code:$PATH

COPY test.csv train.csv valid.csv /code/ 
COPY bert_classifier.py /code
RUN chmod +rx /code/bert_classifier.py
RUN chmod +r /code/*.csv
