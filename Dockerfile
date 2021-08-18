FROM eboraas/openai-gym

RUN apt-get update
RUN apt update

RUN apt-get -y install python3-distutils

RUN pip install -U pip

# Jupyter
RUN pip install notebook --upgrade

# Data Analysis
RUN pip install pandas

