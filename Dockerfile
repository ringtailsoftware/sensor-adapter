FROM debian

RUN apt-get update
RUN apt-get install -y software-properties-common curl git python-setuptools
RUN apt-get install -y build-essential python-pip
RUN pip install -U platformio

# Build dummy project to force dependency installs
WORKDIR /dummy
RUN platformio init
COPY platformio.ini /dummy/platformio.ini
RUN echo 'void setup(){} void loop(){}\n' > /dummy/src/dummy.ino
RUN platformio run
RUN rm -rf /dummy

WORKDIR /src
