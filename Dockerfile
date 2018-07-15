#
#
# Build: docker build --rm --tag ds-test .
# Push: docker tag my_image $DOCKER_ID_USER/my_image
#
# git status
# git commit -m "comments Ubuntu and R to 3.4.2 "
# git push
#

FROM montereytony/ugba147
USER root
RUN ln -s /usr/lib/git-core/* /usr/local/bin
RUN conda update -n base conda
RUN /opt/conda/bin/pip install --upgrade pip
RUN pip3 install --upgrade datascience oauthenticator nbgitpuller nbinteract autopep8 isort
RUN conda install -c conda-forge jupyter_contrib_nbextensions jupyter_nbextensions_configurator
RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
#RUN jupyter nbextension enable --py jupyter_contrib_nbextensions --sys-prefix
#RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix
#RUN jupyter serverextension enable --sys-prefix      nbgitpuller
USER jovyan
RUN jupyter nbextensions_configurator enable
