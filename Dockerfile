# Docker file to run a container that will run the Terminal game.

# Load OpenJDK v10+ image
FROM openjdk:23-slim-bullseye

# Set locale for variable (pulled from dockerfile in original OpenAI
# GPT2 repository).
ENV LANG=C.UTF-8

# Create a directory in the docker container. Set the working directory
# in the container to that newly created directory and then add all
# files from the current directory in the host to the working directory
# in the container.
RUN mkdir /terminal-ai
WORKDIR /terminal-ai
ADD . /terminal-ai

# Set up a volume so that the current directory in the host is
# connected to the working directory in the container.

# Install Python 3 (v3.9 is used I believe).
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN python3 -m pip install --upgrade pip

# Install all required modules in the requirements.txt file.

# Run the Terminal game with the selected algorithms.
# CMD ["python3", "--version"]
# CMD ["python3", "C1GamesStarterKit/scripts/run_match.py", "python-algo", "python-algo"]