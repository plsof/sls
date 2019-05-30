inotify-install:
  file.managed:
    - name: /usr/local/src/inotify-tools-3.14-1.el6.x86_64.rpm
    - source: salt://packages/inotify-tools-3.14-1.el6.x86_64.rpm
  cmd.run:
    - cwd: /usr/local/src
    - name: "rpm -ih inotify-tools-3.14-1.el6.x86_64.rpm"

/usr/local/zabbix/bin/DirMonitor.sh:
  file.managed:
    - source: salt://monitor/DirMonitor.sh
    - mode: 0755

/usr/local/zabbix/bin/Inotifywait.sh:
  file.managed:
    - source: salt://monitor/Inotifywait.sh
    - mode: 0755

/usr/local/zabbix/etc/zabbix_agentd.conf.d/DirMonitor.conf:
  file.managed:
    - source: salt://monitor/DirMonitor.conf
    - mode: 0755

/tmp/Monitor/DirMonitor:
  file.directory:
    - user: zabbix
    - group: zabbix

zabbix_restart:
  cmd.run:
    - name: "killall /usr/local/zabbix/sbin/zabbix_agentd && /usr/local/zabbix/sbin/zabbix_agentd"

inotify-start:
  cmd.run:
    - name: "sh /usr/local/zabbix/bin/Inotifywait.sh /bin/ /etc/init.d/ /etc/rc.d/init.d/ /etc/rc.d/ /etc/ssh/ /etc/sysconfig/ /usr/bin/ /usr/sbin/ /var/spool/cron/ &"
    - bg: True
