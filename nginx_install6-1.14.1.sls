pkg-init:
  pkg.installed:
    - names:
      - pcre-devel
      - openssl
      - openssl-devel

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
  cmd.run:
    - cwd: /data/tmp/nginx-1.14.1
    - name: "./configure --prefix=/data/server/nginx --with-http_stub_status_module  --with-http_gzip_static_module --with-http_ssl_module && make -j `grep processor /proc/cpuinfo | wc -l`  &&  make install"
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
