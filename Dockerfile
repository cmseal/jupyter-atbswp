ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Chris Seal <chris.seal@me.com>"

ARG TEST_ONLY_BUILD

USER $NB_UID

RUN pip install -U pip

RUN conda config --add channels conda-forge && \
    conda install --quiet -y \
    'openpyxl' \
    'pyautogui' \
    'PyPDF2' \
    'python-docx' \
    'selenium' \
    'imapclient' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
