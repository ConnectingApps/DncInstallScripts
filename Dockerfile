ARG version='20.04'
FROM ubuntu:${version}
COPY . .
RUN tr -d '\015' < InstallDnc31.sh > InstallDnc31Unix.sh
RUN chmod +x InstallDnc31Unix.sh
RUN ./InstallDnc31Unix.sh
ENTRYPOINT [ "sleep", "5d" ]