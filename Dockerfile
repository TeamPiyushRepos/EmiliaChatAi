FROM nikolaik/python-nodejs:python3.9-nodejs18
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
    
    # cloning the repo and installing requirements.
RUN apt update && apt upgrade -y
# Okteto CLI
RUN apt install nmap -y
# changing workdir
COPY requirements.txt .

COPY . /app/python3 main.py
WORKDIR /app/
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt
CMD python3 main.py
