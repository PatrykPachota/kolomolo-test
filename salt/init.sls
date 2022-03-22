ginx:
  pkg:
    - installed
  service:
    - running
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
      -file: /etc/nginx/sites-available/default
/etc/nginx/nginx.conf:
  file:
    - managed
    - source: salt://nginx/nginx.conf
    - user: root
    - group: root
    - mode: 640
/etc/nginx/sites-available/default.jinja:
  file.managed:
    - source: salt://nginx/files/etc/nginx/sites-available/default.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 640
/usr/share/nginx/html/index.html:
  file.managed:
    - source: salt://nginx/files/usr/share/nginx/html/index.html.jinja
    - template: jinja
    - user: root
    - group: root
    - mode: 644
