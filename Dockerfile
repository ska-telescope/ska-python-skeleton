FROM artefact.skao.int/ska-tango-images-pytango-builder:9.4.1

# install common tools
RUN apt update

# install python and poetry
RUN add-apt-repository ppa:deadsnakes/ppa 
RUN apt update && apt install -y python3.8 git python3.8-venv python3-pip
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/opt/poetry python3 -
RUN ln -s /opt/poetry/bin/poetry /usr/local/bin/poetry 

# install docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
RUN apt install -y docker-ce

# Copy poetry.lock* in case it doesn't exist in the repo
COPY pyproject.toml poetry.lock* ./

# Install runtime dependencies
RUN poetry install --no-dev --no-root

# copy application
COPY ./src /app
