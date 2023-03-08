FROM python:3.10.10-slim

ARG REQ_DIR=/usr/local/
ARG WORK_DIR=/usr/local/workdir/
ARG USER=etlv2


# set non-root user
RUN useradd -ms /bin/sh $USER
USER $USER

# disable pip warning on path
ENV PATH="${PATH}:/home/${USER}/.local/bin"


# install libs
COPY ./requirements.txt $REQ_DIR/requirements.txt

RUN pip install -r $REQ_DIR/requirements.txt

# set workdir
WORKDIR $WORK_DIR
