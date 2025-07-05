# w1jp: 250703
# This Dockerfile should be in a peer repo with ed-donner/llm_engineering
# /your_project_folder
#   -> /llm_engineering
#   -> /LLM_Engineering_env
#
# IMPORTANT: Build this image from the project root folder (i.e., ../LLM_Engineering_env)
#   docker build -f LLM_Engineering_env/Dockerfile .
FROM continuumio/anaconda3

WORKDIR /tmp

COPY llm_engineering/environment.yml environment.yml

COPY LLM_Engineering_env/requirements.txt requirements.txt

RUN apt update && apt install vim nano less

RUN conda env create -f environment.yml && \
    conda clean -a -y && \
    echo "conda activate $(head -1 environment.yml | cut -d' ' -f2)" >> ~/.bashrc

RUN pip install -r requirements.txt

WORKDIR /wrk

ENTRYPOINT ["bash"]
