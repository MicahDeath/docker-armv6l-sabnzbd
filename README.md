# docker-armv6l-sabnzbd
Docker build script for sabnzbd that works on the Raspberry Pi rev B (armv6l)

This DOES work, but extremely slow. The UI intermittently thinks the server has been restarted. 
I'm not using this, but I'll leave it here for reference if someone else is as curious as I was. =)

# Build
```bash
git clone https://github.com/MicahDeath/docker-armv6l-sabnzbd
cd docker-armv6l-sabnzbd
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
 # Setup
 Once setup, go into the web interface options and set the downloads paths to /Downloads/<path> for the volume mapping to work.
 
