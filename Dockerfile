FROM debian:bullseye-slim

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y -qq \
        clamav-daemon \
        clamav-freshclam \
        clamdscan \
        ca-certificates \
        netcat-openbsd \
        cron \
        wget python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo '0 6 * * * root /scan.sh >/proc/1/fd/1 2>/proc/1/fd/2' > /etc/crontab && \
    mkdir /var/run/clamav && \
    chown clamav:clamav /var/run/clamav && \
    chmod 750 /var/run/clamav && \
    freshclam

RUN pip3 install --upgrade pip
# Image specific layers under this line
RUN mkdir -p /logs /data
RUN echo `date`: File created >> /logs/clamscan.log

COPY conf /etc/clamav-custom
COPY start.py /start.py
COPY health.sh /health.sh
COPY scan.sh /scan.sh
RUN chmod +x /health.sh && \
    chmod 0744 /scan.sh

CMD /start.py
