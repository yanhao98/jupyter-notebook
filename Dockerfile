# docker run -it --rm veighna/veighna:3.9.2 bash


FROM quay.io/jupyter/base-notebook

RUN set -ex \
    && sed -i '/python 3.11.*/d' /opt/conda/conda-meta/pinned \
    && conda install python=3.10 -y \
    && python3 -m pip install --upgrade pip wheel --index https://pypi.vnpy.com

USER root

RUN set -ex \
    && python3 -m pip install numpy==1.26.4 \
    && apt update && apt install -y build-essential --no-install-recommends \
    && pushd /tmp \
    && wget https://pip.vnpy.com/colletion/ta-lib-0.4.0-src.tar.gz -O ta-lib-0.4.0-src.tar.gz \
    && tar -xf ta-lib-0.4.0-src.tar.gz \
    && cd ta-lib \
    && ./configure --prefix=/usr \
    && make \
    && sudo make install \
    && ta-lib-config --libs \
    && popd \
    && python3 -m pip install TA-Lib==0.4.24 \
    && python3 -c "import talib; print(talib.__version__)"

RUN set -ex && python3 -m pip install \
    vnpy \
    vnpy-ctp \
    vnpy-ctastrategy \
    db \
    vnpy-sqlite \
    vnpy-mysql \
    vnpy-ctabacktester \
    clickhouse-driver \
    jupyterlab-language-pack-zh-CN \
    torch torchvision torchaudio

RUN set -ex \
    && apt-get update \
    && apt-get install -y tzdata \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata

# USER ${NB_UID}

ENV GRANT_SUDO=yes
ENV JUPYTER_ENABLE_LAB=yes
ENV CHOWN_HOME=yes
ENV RESTARTABLE=yes
CMD [ "bash", "-c", "sudo chmod -R 777 /home/jovyan && start-notebook.py" ]
