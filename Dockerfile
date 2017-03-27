FROM almir/webhook

RUN wget -O /usr/bin/rancher https://raw.githubusercontent.com/etlweather/gaucho/master/services.py

ADD hooks /opt/
ADD hooks.json /etc/webhook/hooks.json
CMD ["-verbose", "-hooks=/etc/webhook/hooks.json", "-hotreload"]
