sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install -y libssl-dev libgeoip-dev libatomic-ops-dev
bash <(curl -f -L -sS https://ngxpagespeed.com/install) -y \
--nginx-version 1.10.3 \
-a '--user=www-data --group=www-data --prefix=/usr/share/nginx --sbin-path=/usr/sbin/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --lock-path=/var/lock/nginx.lock --pid-path=/var/run/nginx.pid --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-select_module --with-poll_module --with-file-aio --with-ipv6 --with-http_ssl_module --with-http_geoip_module --with-http_sub_module --with-http_gzip_static_module --with-http_stub_status_module --with-http_v2_module --with-cpu-opt=CPU --with-pcre --with-pcre-jit --with-md5-asm --with-sha1-asm --with-zlib-asm=CPU --with-libatomic'
sudo useradd -r nginx
sudo useradd -r www-data
sudo mkdir -p /var/lib/nginx/body
sudo mkdir -p /usr/lib/nginx/modules
sudo mkdir -p /usr/share/nginx/html
sudo bash -c "echo '<h1>Hello World</h1>' > /usr/share/nginx/html/index.html"
sudo bash -c "echo '<h1>An error occurred.</h1><p>Sorry, the page you are looking for is currently unavailable.<br/>
Please try again later.</p>' >> /usr/share/nginx/html/50x.html"

sudo apt-get install python-certbot-nginx
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048


#sudo certbot --nginx -d example.com -d www.example.com

#crontab  changes -
#0 1 1 * * /usr/bin/certbot renew --quiet
#30 1 1 * * /etc/init.d/nginx restart
#30 1 1 * * systemctl restart nginx.service
