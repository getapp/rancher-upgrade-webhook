FROM almir/webhook

ADD hooks /opt/
ADD hooks.json /etc/webhook/hooks.json
# copied from https://raw.githubusercontent.com/etlweather/gaucho
ADD rancher.py /bin/

CMD ["-verbose", "-hooks=/etc/webhook/hooks.json", "-hotreload"]
