FROM python:3.11-slim-bullseye
WORKDIR .
COPY . .

RUN apt-get update -y
RUN apt-get install -y build-essential
RUN apt-get install -y curl
RUN apt-get install -y git
RUN git clone https://github.com/axiomatic-systems/Bento4.git && \
cd Bento4 &&\
apt-get install -y cmake && \
mkdir cmakebuild && \ 
cd cmakebuild/ && \
cmake -DCMAKE_BUILD_TYPE=Release .. &&\
make &&\ 
make install
RUN apt-get install -y aria2
RUN apt-get update -qq && apt-get install -y wget pv jq python3-dev ffmpeg mediainfo
RUN pip3 install -r requirements.txt
CMD ["python3", "main.py"]
