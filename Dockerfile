FROM ubuntu:latest
LABEL authors="ADM"

ENTRYPOINT ["top", "-b"]