role:
  grains.present:
    - value: docker


Add docker repo:
  pkgrepo.managed:
    - name: deb [arch=amd64] https://download.docker.com/linux/debian	buster	stable
    - file: /etc/apt/sources.list.d/docker.list
    - key_url: https://download.docker.com/linux/debian/gpg

Install docker:
  pkg.installed:
    - pkgs:
      - docker-ce
      - docker-ce-cli
      - containerd.io 

python3-pip:
  pkg.installed

#library for the docker engine API, needed by docker states
docker:
  pip.installed

{% if pillar.get('volumes') %}
{% for volume in pillar['volumes'] %}
{{ volume }}:
  docker_volume.present
{% endfor %}
{% endif %}

{% if pillar['containers'] is defined %}
{% for container in pillar['containers'] %}
{{ container.name }}:
  docker_container.running:
    - image: {{ container.image }}
    - restart_policy: {{ container.restart_policy }} 
{% if container.port_bindings is defined%}
    - port_bindings: 
  {% for port in container.port_bindings %}
      - {{ port.from }}:{{ port.to }}
  {% endfor %}
{% endif %}
 
{% if container.binds is defined %}
    - binds:
  {% for bind in container.binds %}
      - {{ bind.host }}:{{ bind.cont }}
  {% endfor %}
{% endif %}


{% if container.vars is defined %}
    - environment:
  {% for var in container.vars %}
      - {{ var.name }}={{ var.value }}
  {% endfor %}
{% endif %}


{% endfor %}
{% endif %}

{% if pillar['global_containers'] is defined %}
{% for container in pillar['containers'] %}
#placeholder if we find a use case for global conts (portainer, maybe traefik?

#portainer:
#  docker_container.running:
#    - force: True
#    - image: portainer/portainer-ce
#    - port_bindings: 
#      - 9000:9000
#      - 8000:8000
#    - restart_policy: always
#    - binds:
#      - portainer_data:/data
#      - /var/run/docker.sock:/var/run/docker.sock

{% endfor %}
{% endif %}
