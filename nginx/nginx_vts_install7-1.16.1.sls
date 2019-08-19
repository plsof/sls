pkg-init:
  pkg.installed:
    - names:
      - pcre-devel
      - openssl
      - openssl-devel

nginx-user:
  user.present:
    - shell: /sbin/nologin
    - createhome: False

vts-download:
  cmd.run:
    - cwd: /data/tmp
    - name: git clone git://github.com/vozlt/nginx-module-vts.git
    - unless: ls /data/server/nginx

nginx-install:
  archive.extracted:
    - name: /data/tmp/
    - source: salt://packages/nginx/nginx-1.16.1.tar.gz
    - archive_format: tar
    - options: -x
    - if_missing: /data/tmp/nginx-1.16.1
  cmd.run:
    - cwd: /data/tmp/nginx-1.16.1
    - name: "./configure --prefix=/data/server/nginx --with-http_gzip_static_module --with-http_ssl_module --add-module=/data/tmp/nginx-module-vts && make -j `grep processor /proc/cpuinfo | wc -l`  &&  make install"
    - unless: ls /data/server/nginx

/data/server/nginx/conf/nginx.conf:
  file.managed:
    - source: salt://saltos/nginx/file/vts-nginx.conf
    - user: root
    - group: root
    - mode: 0644

/data/server/nginx/conf/conf.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755

/data/server/nginx/conf/conf.d/vts.conf:
  file.managed:
    - source: salt://saltos/nginx/file/vts.conf
    - user: root
    - group: root
    - mode: 0644

/data/logs/nginx:
  file.directory:
    - user: root
    - group: root
    - makedirs: True
    - dir_mode: 755
