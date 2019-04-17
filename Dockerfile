FROM balenalib/armv7hf-debian:stretch-build
LABEL io.balena.device-type="raspberrypi3"
RUN echo "deb http://archive.raspbian.org/raspbian stretch main contrib non-free rpi firmware" >>  /etc/apt/sources.list \
    && apt-key adv --batch --keyserver ha.pool.sks-keyservers.net  --recv-key 0x9165938D90FDDD2E \
    && echo "deb http://archive.raspberrypi.org/debian stretch main ui" >>  /etc/apt/sources.list.d/raspi.list \
    && apt-key adv --batch --keyserver ha.pool.sks-keyservers.net  --recv-key 0x82B129927FA3303E
RUN apt-get update && apt-get install -y --no-install-recommends \
        less \
        libraspberrypi-bin \
        kmod \
        net-tools \
        ifupdown \
        iputils-ping \
        i2c-tools \
        usbutils \
        python \
        python-dev \
        python-pip \
        python-dev \
        python-pyaudio \
        python3-pyaudio \
        python-virtualenv \
        pi-bluetooth \
        blueman \
        pulseaudio \
        pavucontrol \
        pulseaudio-module-bluetooth \
        swig \
        make \
        swig3.0 \
        sox \
        npm \
        libatlas-base-dev \
    && rm -rf /var/lib/apt/lists/*

RUN npm install --save snowboy
RUN pip install pyaudio
RUN node-pre-gyp clean configure build

