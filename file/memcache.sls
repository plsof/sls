/etc/init.d/tomcat_all restart:
    cmd.run:
        - onchanges:
            - file: /etc/hosts

/etc/hosts:
    file.replace:
    - pattern: "^40.40.40.240 .*(memecache01.ysten.org)"
    - repl: '20.20.20.241 \1'
    - flags: ['MULTILINE']
    - backup: .bak
    - show_changes: True
    #- append_if_not_found: True
    #- not_found_content: "20.20.20.241 memecache01.ysten.org"
