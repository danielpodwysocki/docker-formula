#don't name it same as the container, or there will be a name conflict!
volumes:
  - portainer_data


containers:
  - name: portainer
    image: portainer/portainer-ce
    restart_policy: always
    port_bindings:
      - from: 9000
        to: 9000
      - from: 8000
        to: 8000
    binds:
      - host: /var/run/docker.sock
        cont: /var/run/docker.sock
      - host: portainer_data 
        cont: /data
    vars:
      - name: VAR1
        value: VALUE1
