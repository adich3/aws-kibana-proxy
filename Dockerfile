FROM debian:stable-slim
RUN apt-get update &&  apt-get install -y \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg-agent \
     software-properties-common && curl -sL 'https://getenvoy.io/gpg' | apt-key add - \
     && add-apt-repository \
     "deb [arch=amd64] https://dl.bintray.com/tetrate/getenvoy-deb \
     $(lsb_release -cs) \
     stable" \
     && mkdir -p /etc/envoy/ssl

COPY app/* /etc/envoy/

RUN apt-get update && apt-get install -y getenvoy-envoy \
     && openssl req -x509 -sha256 -nodes -days 10365 -newkey rsa:2048 -keyout /etc/envoy/ssl/server.key -out /etc/envoy/ssl/server.crt -subj "/CN=*.kibana.in" \
     && chmod +x /etc/envoy/start-envoy.sh

CMD ["/etc/envoy/start-envoy.sh"]
