#6000
log-6000:
  file.replace:
    - name: /data/app/tomcat_wtv_epg_6000/webapps/ysten-lvoms-epg/WEB-INF/classes/log4j2.xml
    - pattern: "ysten-lvoms-epg-error.log"
    - repl: 'ysten-lvoms-epg-error_6000.log'
    - show_changes: True

error-6000:
  file.replace:
    - name: /data/app/tomcat_wtv_epg_6000/webapps/ysten-lvoms-epg/WEB-INF/classes/log4j2.xml
    - pattern: "ysten-lvoms-epg-service.log"
    - repl: 'ysten-lvoms-epg-service_6000.log'
    - show_changes: True

#6001
log-6001:
  file.replace:
    - name: /data/app/tomcat_wtv_epg_6001/webapps/ysten-lvoms-epg/WEB-INF/classes/log4j2.xml
    - pattern: "ysten-lvoms-epg-error.log"
    - repl: 'ysten-lvoms-epg-error_6001.log'
    - show_changes: True

error-6001:
  file.replace:
    - name: /data/app/tomcat_wtv_epg_6001/webapps/ysten-lvoms-epg/WEB-INF/classes/log4j2.xml
    - pattern: "ysten-lvoms-epg-service.log"
    - repl: 'ysten-lvoms-epg-service_6001.log'
    - show_changes: True

#6002
log-6002:
  file.replace:
    - name: /data/app/tomcat_wtv_epg_6002/webapps/ysten-lvoms-epg/WEB-INF/classes/log4j2.xml
    - pattern: "ysten-lvoms-epg-error.log"
    - repl: 'ysten-lvoms-epg-error_6002.log'
    - show_changes: True

error-6002:
  file.replace:
    - name: /data/app/tomcat_wtv_epg_6002/webapps/ysten-lvoms-epg/WEB-INF/classes/log4j2.xml
    - pattern: "ysten-lvoms-epg-service.log"
    - repl: 'ysten-lvoms-epg-service_6002.log'
    - show_changes: True

#6003
log-6003:
  file.replace:
    - name: /data/app/tomcat_wtv_epg_6003/webapps/ysten-lvoms-epg/WEB-INF/classes/log4j2.xml
    - pattern: "ysten-lvoms-epg-error.log"
    - repl: 'ysten-lvoms-epg-error_6003.log'
    - show_changes: True

error-6003:
  file.replace:
    - name: /data/app/tomcat_wtv_epg_6003/webapps/ysten-lvoms-epg/WEB-INF/classes/log4j2.xml
    - pattern: "ysten-lvoms-epg-service.log"
    - repl: 'ysten-lvoms-epg-service_6003.log'
    - show_changes: True

#6004
log-6004:
  file.replace:
    - name: /data/app/tomcat_wtv_epg_6004/webapps/ysten-lvoms-epg/WEB-INF/classes/log4j2.xml
    - pattern: "ysten-lvoms-epg-error.log"
    - repl: 'ysten-lvoms-epg-error_6004.log'
    - show_changes: True

error-6004:
  file.replace:
    - name: /data/app/tomcat_wtv_epg_6004/webapps/ysten-lvoms-epg/WEB-INF/classes/log4j2.xml
    - pattern: "ysten-lvoms-epg-service.log"
    - repl: 'ysten-lvoms-epg-service_6004.log'
    - show_changes: True

#6005
log-6005:
  file.replace:
    - name: /data/app/tomcat_wtv_epg_6005/webapps/ysten-lvoms-epg/WEB-INF/classes/log4j2.xml
    - pattern: "ysten-lvoms-epg-error.log"
    - repl: 'ysten-lvoms-epg-error_6005.log'
    - show_changes: True

error-6005:
  file.replace:
    - name: /data/app/tomcat_wtv_epg_6005/webapps/ysten-lvoms-epg/WEB-INF/classes/log4j2.xml
    - pattern: "ysten-lvoms-epg-service.log"
    - repl: 'ysten-lvoms-epg-service_6005.log'
    - show_changes: True
