# docker-armv6l-sabnzbd
Docker build script for sabnzbd that works on the Raspberry Pi rev B (armv6l)

This DOES work, but extremely slow. The UI intermittently thinks the server has been restarted. 
I'm not using this, but I'll leave it here for reference if someone else is thinking the same thing. =)

# Build
```bash
git clone https://github.com/MicahDeath/docker-armv6l-sabnzbd
cd ...
docker build -t sabnzbd:armv5 .
```
# Run
```bash
 docker run -d \
   -p 58080:58080 \
   -v ~/docker/sabnzbd/sabnzbd:/config \
   -v ~/docker/sabnzbd/data:/Downloads
   sabnzbd:armv5
```
