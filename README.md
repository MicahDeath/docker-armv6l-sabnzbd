# docker-armv6l-sabnzbd
Docker build script for sabnzbd that works on the Raspberry Pi rev B (armv6l)

# Note
This is not working yet...

# Build
```bash
git clone ...
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
