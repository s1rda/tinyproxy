--- Installing a simple HTTP / HTTPS proxy (Tinyproxy)
 
apt-get install -y tinyproxy
 
nano /etc/tinyproxy/tinyproxy.conf
 
Next, we edit the configs (right as you please, you are the king here):
 
# User and group
User tinyproxy
Group tinyproxy
#Port
Port 8888
# Timeout
Timeout 300
# Default html error file
DefaultErrorFile "/usr/share/tinyproxy/default.html"
# html stat file
StatFile "/usr/share/tinyproxy/stats.html"
# Log file
Logfile "/var/log/tinyproxy/tinyproxy.log"
# Logging level
LogLevel Info
# Pid file
PidFile "/var/run/tinyproxy/tinyproxy.pid"
# Maximum number of simultaneously connected clients.
MaxClients 20
# Minimum and maximum number of worker processes.
MinSpareServers 5
MaxSpareServers 20
# The number of processes running simultaneously at server start
StartServers 10
# Number of connections per process, 0 by default
MaxRequestsPerChild 0
# Allow local connections
Allow 127.0.0.1
# Allow connections from the client (your ip-address or subnet)
Allow XXX.XXX.XXX.XXX
# Allow connections using the CONNECT method for working with HTTPS sites
ConnectPort 443
ConnectPort 563
# Proxy header name
ViaProxyName "tinyproxy"
# Disable Via headers transmitting the server version
DisableViaHeader Yes
# Disable the transfer of the client's real ip-address
XTinyproxy No
 
systemctl restart tinyproxy
