# docker-armv6l-sabnzbd
Docker build script for sabnzbd that works on the Raspberry Pi B+ (armv6l)

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
   sabnzbd:armv5
```
