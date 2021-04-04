FROM ubuntu

MAINTAINER Parthav "parthavpatel28@gmail.com"

# Here we'll install python dependencies
RUN apt-get update -y 
RUN apt-get install -y python3-pip python3-dev build-essential
RUN apt-get update \
    && pip3 install --upgrade pip

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT ["python3"]

CMD ["server.py"]