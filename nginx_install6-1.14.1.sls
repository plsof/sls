pkg-init:
  pkg.installed:
    - names:
      - pcre-devel
      - openssl
      - openssl-devel

openssl-install:
  archive.extracted:
    - name: /data/tmp
    - source: salt://packages/openssl/openssl-1.0.2p.tar.gz
    - archive_format: tar
    - options: -x
    - if_missing: /data/tmp/openssl-1.0.2p
  cmd.run:
    - cwd: /data/tmp/openssl-1.0.2p
    - name: "./config --prefix=/data/server/openssl-1.0.2p &&  make -j `grep processor /proc/cpuinfo | wc -l`  &&  make install"
    - unless: /data/server/openssl-1.0.2p

nginx:
  user.present:
    - shell: /sbin/nologin
    - createhome: False

nginx-install:
  archive.extracted:
    - name: /data/tmp/
    - source: salt://packages/nginx/nginx-1.14.1.tar.gz
    - archive_format: tar
    - options: -x
    - if_missing: /data/tmp/nginx-1.14.1
  file.managed:
    - name: /data/tmp/nginx-1.14.1/auto/lib/openssl/conf
    - source: salt://saltos/nginx/file/conf
  cmd.run:
    - cwd: /data/tmp/nginx-1.14.1
    - name: "./configure --prefix=/data/server/nginx --with-http_stub_status_module  --with-http_gzip_static_module --with-http_ssl_module --with-openssl=/data/server/openssl-1.0.2p && make -j `grep processor /proc/cpuinfo | wc -l`  &&  make install"
    - unless: ls /data/server/nginx

/data/server/nginx/conf/nginx.conf:
  file.managed:
    - source: salt://saltos/nginx/file/nginx.conf
    - user: root
    - group: root
    - mode: 0644

/data/server/nginx/conf/conf.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755

/data/logs/nginx:
  file.directory:
    - user: root
    - group: root
    - makedirs: True
    - dir_mode: 755
