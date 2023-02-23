### Commands

get interfaces
> ip -a

get used ports
> netstat -tulpn

get distr info
cat /etc/*-release
 
get linux release
> cat /proc/version

disk usage
> df -h --total

current dir content size
> du -sh *

get package version:
> apt show nginx

show file tail:
> tail -100f /var/log/nginx/app.ans.srwx.net.access.log 

show nested dirs content from . recursively:
> ls -laR *

get DNS info
> dig aquariusborelias.devops.rebrain.srwx.net

recursively find all files due to mask
> find . -name "foo*" 2>/dev/null

copy dirs and content
> cp -R path_to_source path_to_destination/

> cp -a path_to_source/. path_to_destination/

### SSL 

Security check

> https://www.cloudflare.com/diagnostic-center/

> https://www.ssllabs.com/ssltest/analyze.html?d=aquariusborelias.devops.rebrain.srwx.net&latest

