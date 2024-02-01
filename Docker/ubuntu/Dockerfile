# Use an official Ubuntu base image
FROM ubuntu:latest

# Install Ubuntu desktop and VNC server
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-goodies \
    tightvncserver \
    firefox
    
ENV USER root

# Set up VNC server
RUN mkdir /root/.vnc
COPY xstartup /root/.vnc/xstartup
RUN chmod +x /root/.vnc/xstartup

# Set a VNC password
RUN echo "your_password" | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd

# Expose the VNC server port
EXPOSE 5901

# Set the default command to start the VNC server
CMD ["sh", "-c", "vncserver :1 -geometry 1280x800 -depth 24 && tail -f /dev/null"]
