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
RUN /opt/conda/bin/pip install --upgrade pip
RUN pip3 install --upgrade datascience autopep8 oauthenticator nbgitpuller nbinteract
RUN conda update -n base conda
RUN conda install -c conda-forge jupyter_contrib_nbextensions
RUN conda install -c conda-forge jupyter_nbextensions_configurator
RUN jupyter nbextension enable --py jupyter_contrib_nbextensions --sys-prefix

RUN jupyter nbextension install --py widgetsnbextension --sys-prefix
RUN jupyter nbextension enable  --py widgetsnbextension --sys-prefix
#RUN pip3 install oauthenticator
#
#RUN pip3 install nbgitpuller
RUN jupyter serverextension enable --sys-prefix      nbgitpuller
#RUN jupyter serverextension enable --sys-prefix --py nbgitpuller
#
#
#RUN pip3 install git+https://github.com/data-8/nbinteract.git
#RUN pip3 install nbinteract
#RUN jupyter nbextensions_configurator enable --user
#
#
#
#RUN jupyter nbextension install --py nbinteract
#RUN jupyter nbextensions_configurator enable
USER jovyan
RUN jupyter nbextensions_configurator enable
