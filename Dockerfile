FROM arm32v5/debian:stretch-slim
MAINTAINER MicahDeath <micah_death@hotmail.com>

# Based on: https://github.com/mbentley/docker-sabnzbd.git
RUN sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    ca-certificates \
    locales \
    sabnzbdplus \
 && echo 'LANG="en_US.UTF-8"' >> /etc/default/locale \
 && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
 && locale-gen \
 && rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime \
# && groupadd -g 501 sabnzbd \
 && useradd -u 501 -g 100 -d /config sabnzbd \
 && mkdir /config \
 && mkdir /Downloads \
 && chown -R sabnzbd:users /config \
 && chown -R sabnzbd:users /Downloads

RUN echo "#!/bin/sh" > /init.sh \
 && echo "echo 'Starting sabnzbdplus...'" >> /init.sh \
 && echo "touch /config/sabnzbd.ini" >> /init.sh \
 && echo "chown -R sabnzbd:users /config" >> /init.sh \
 && echo "" >> /init.sh \
 && echo "" >> /init.sh \
 && echo "/usr/bin/sabnzbdplus \" >> /init.sh \
 && echo "  --config-file /config \" >> /init.sh \
 && echo "  --browser 0 \" >> /init.sh \
 && echo "  --console \" >> /init.sh \
 && echo "  --disable-file-log \" >> /init.sh \
 && echo "  --pause \" >> /init.sh \
 && echo "  --server 0.0.0.0:58080" >> /init.sh \
 && chmod +x /init.sh
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

VOLUME /config
VOLUME /Downloads
USER sabnzbd
EXPOSE 58080
#ENTRYPOINT ["/usr/bin/sabnzbdplus"]
#CMD ["--config-file","/config","--browser","0","--console","--server",":58080"]
ENTRYPOINT ["/init.sh"]
