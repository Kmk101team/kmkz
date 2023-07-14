### UPDATE DULU
<pre><code>apt-get update && apt-get upgrade -y && update-grub && sleep 2 && apt install curl -y && apt install wget -y && reboot</code></pre>




### INSTALL SCRIPT
<pre><code>rm -f setup.sh && sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/Kmk101team/kmkz/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh</code></pre>


