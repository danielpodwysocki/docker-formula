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


#portainer_data:
#  docker_volume.present

#portainer:
#  docker_container.running:
#    - force: True
#    - image: portainer/portainer-ce
#    - port_bindings: 
#[host port]:[container port]
#      - 9000:9000
#      - 8000:8000
#    - restart_policy: always
#    - binds:
#      - portainer_data:/data
#      - /var/run/docker.sock:/var/run/docker.sock
