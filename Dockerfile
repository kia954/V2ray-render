FROM alpine:latest

RUN apk add --no-cache curl unzip && \
    mkdir -p /etc/v2ray /usr/local/bin && \
    curl -L -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray.zip -d /tmp && \
    mv /tmp/v2ray*/v2ray /usr/local/bin/ && \
    mv /tmp/v2ray*/v2ctl /usr/local/bin/ && \
    chmod +x /usr/local/bin/v2ray /usr/local/bin/v2ctl && \
    rm -rf /tmp/* v2ray.zip

COPY config.json /etc/v2ray/config.json

CMD ["v2ray", "-config=/etc/v2ray/config.json"]
