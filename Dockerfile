FROM odoo:18

USER root

RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf \
    && apt-get update && apt-get install -y locales \
    && mkdir -p /usr/share/man/man1 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/odoo

ADD requirements.txt /home/odoo/

RUN pip3 install -r /home/odoo/requirements.txt --break-system-packages

USER odoo

ENV SHELL=/bin/bash

ENTRYPOINT ["/entrypoint.sh"]

CMD ["odoo"]
