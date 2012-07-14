GWEB=ganglia-web-3.5.0-1.noarch.rpm
SRC_BASE=/usr/local/src/
GWEB_RPM=$SRC_BASE$GWEB

if [ ! -f /usr/local/src/$GWEB ]; then
   wget -O $GWEB_RPM http://downloads.sourceforge.net/project/ganglia/ganglia-web/3.5.0/ganglia-web-3.5.0-1.noarch.rpm?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fganglia%2Ffiles%2Fganglia-web%2F3.5.0%2F&ts=1342191314&use_mirror=cdnetworks-kr-2
   rpm -ihv $GWEB_RPM
   chown -R nginx.nginx /var/lib/ganglia/dwoo
   chown -R nginx.nginx /var/lib/ganglia/conf
fi
