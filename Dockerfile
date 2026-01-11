FROM python:3.11.14


ARG USER_ID=1000
ARG GROUP_ID=1000
RUN groupadd -g ${GROUP_ID} transcriber && \
    useradd -u ${USER_ID} -g ${GROUP_ID} -m -s /bin/bash transcriber

RUN pip3 install openai-whisper numpy wheel torch

RUN apt update && apt install -y ffmpeg vim portaudio19-dev pulseaudio-utils

COPY ./transcrbr.py /home/transcriber/
RUN chown transcriber:transcriber /home/transcriber/transcrbr.py

USER transcriber
WORKDIR /home/transcriber

CMD ["/usr/bin/python3", "/home/transcriber/transcrbr.py"]
