FROM almir/webhook

RUN apk add --update python py-pip curl \
    && pip install requests \
    && pip install baker \
    && pip install websocket-client

ADD hooks/ /opt/hooks/
ADD hooks.json /etc/webhook/hooks.json
ADD bin/ /bin/

CMD ["-verbose", "-hooks=/etc/webhook/hooks.json", "-hotreload"]
