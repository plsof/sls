redis:
  user.present:
    - name: redis
    - shell: /bin/bash
    - home:

redis-install:
  archive.extracted:
    - name: /data/server/
    - source: salt://packages/redis/redis-4.0.14.tar.gz
    - source_hash: 96ae20ffd68b9daee24b702b754d89f3
    - archive_format: tar
    - options: -x
    - if_missing: /data/server/redis-4.0.14
  cmd.run:
    - cwd: /data/server/redis-4.0.14
    - name: "make MALLOC=jemalloc && make install"
    - unless: "/usr/local/bin/redis-server"

/data/server/redis-cluster:
  file.directory:
    - user: redis
    - group: redis
    - mode: 755
    - makedirs: True

/data/logs/redis:
  file.directory:
    - user: redis
    - group: redis
    - mode: 755
    - makedirs: True

{% for port in pillar['redis-cluster']['portlist'] %}
{% set clusterpath = "/data/server/redis-cluster/%s"|format(port) %}

#日志目录
/data/logs/redis/{{ port }}:
  file.directory:
    - user: redis
    - group: redis
    - mode: 755
    - makedirs: True

#安装目录
{{ clusterpath }}:
  file.directory:
    - user: redis
    - group: redis
    - mode: 755
    - makedirs: True

#配置文件
{{ clusterpath }}/redis.conf:
#/data/server/redis-cluster/{{ port }}/redis.conf:
  file.managed:
    - source: salt://saltos/redis/files/redis-cluster.conf
    - template: jinja
    - defaults:
      port: {{ port }}

{% endfor %}
