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
 && chown -R sabnzbd:users /config

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

VOLUME /config
VOLUME /data
USER sabnzbd
EXPOSE 58080
ENTRYPOINT ["/usr/bin/sabnzbdplus"]
CMD ["--config-file","/config","--browser","0","--console","--server",":58080"]
