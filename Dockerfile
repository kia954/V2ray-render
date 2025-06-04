FROM alpine:latest

# نصب v2ray از منبع رسمی
RUN apk add --no-cache curl unzip && \
    mkdir -p /etc/v2ray /usr/local/bin && \
    curl -L -o v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray.zip -d /tmp && \
    mv /tmp/v2ray /usr/local/bin/ && \
    mv /tmp/v2ctl /usr/local/bin/ && \
    chmod +x /usr/local/bin/v2ray /usr/local/bin/v2ctl && \
    rm -rf /tmp/* v2ray.zip

# کپی کانفیگ
COPY config.json /etc/v2ray/config.json

# اجرای v2ray
CMD ["v2ray", "-config=/etc/v2ray/config.json"]
