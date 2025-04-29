# base 包含必要环境
FROM immortalwrt/opde:base

USER opde:opde
ENV HOME /home/opde


WORKDIR /home/opde

RUN wget https://build-scripts.immortalwrt.eu.org/init_build_environment.sh
RUN chmod +x /home/opde/init_build_environment.sh
RUN sudo /home/opde/init_build_environment.sh


