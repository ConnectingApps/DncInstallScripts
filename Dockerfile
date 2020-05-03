FROM ubuntu:20.04
COPY . .
RUN chmod +x InstallDnc31.sh
RUN ./InstallDnc31.sh
ENTRYPOINT [ "sleep", "5d" ]