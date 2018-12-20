ARG BASE_CONTAINER=jupyter/scipy-notebook
FROM $BASE_CONTAINER

LABEL maintainer="Chris Seal <chris.seal@me.com>"

ARG TEST_ONLY_BUILD

USER $NB_UID

RUN pip install --quiet \
    'openpyxl==2.1.4' \
    'pyautogui' \
    'PyPDF2' \
    'python-docx' \
    'pyzmail' \
    'selenium' \
    'imapclient' \
    'python3-xlib' \
    'twilio' && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
