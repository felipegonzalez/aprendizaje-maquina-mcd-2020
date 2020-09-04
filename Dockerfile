FROM rocker/verse:4.0.2

ENV WORKON_HOME /opt/virtualenvs
ENV PYTHON_VENV_PATH $WORKON_HOME/mi_env

## Set up a user modifiable python3 environment
RUN apt-get update && apt-get install -y --no-install-recommends \
        python3-dev \
        python3-venv \
	python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m venv ${PYTHON_VENV_PATH}

RUN chown -R rstudio:rstudio ${WORKON_HOME}
ENV PATH ${PYTHON_VENV_PATH}/bin:${PATH}
RUN echo "PATH=${PATH}" >> /usr/local/lib/R/etc/Renviron && \
    echo "WORKON_HOME=${WORKON_HOME}" >> /usr/local/lib/R/etc/Renviron && \
    echo "RETICULATE_PYTHON_ENV=${PYTHON_VENV_PATH}" >> /usr/local/lib/R/etc/Renviron

## Because reticulate hardwires these PATHs...
RUN ln -s ${PYTHON_VENV_PATH}/bin/pip /usr/local/bin/pip && \
    ln -s ${PYTHON_VENV_PATH}/bin/virtualenv /usr/local/bin/virtualenv

RUN chmod -R u=rwx ${PYTHON_VENV_PATH}
RUN .${PYTHON_VENV_PATH}/bin/activate && \
 pip install \
	pyyaml==3.12 \
	Pillow==7.2.0 \
	requests==2.24.0 \
	scipy==1.4.1 \
	tensorflow==2.2.0 \
	keras==2.3.0 
RUN install2.r reticulate tensorflow keras

RUN apt-get update && apt-get install -y ffmpeg pngquant rustc cargo
  
RUN r -e 'devtools::install_github("bmschmidt/wordVectors")'
RUN install2.r --error tidymodels iml pdp

RUN install2.r --error \
    RcppRoll \
    glmnet \
    xgboost \
    ranger \
    tsne \
    irlba \
    kknn \
    splines2 \
    ggrepel \
    gganimate \
    patchwork

RUN install2.r --error imager gifski 
#RUN r -e 'devtools::install_github("mtennekes/tabplot")'

RUN install2.r --error kernlab
