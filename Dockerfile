FROM almir/webhook

RUN apk add --update python py-pip \
    && pip install requests \
    && pip install baker \
    && pip install websocket-client

ADD hooks/ /opt/hooks/
ADD hooks.json /etc/webhook/hooks.json
# copied from https://raw.githubusercontent.com/etlweather/gaucho
ADD rancher.py /bin/

CMD ["-verbose", "-hooks=/etc/webhook/hooks.json", "-hotreload"]
