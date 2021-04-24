# docker-formula

This is a SaltStack formula for deploying docker containers and docker-compose files, served directly from your Salt master, using the built in Salt fileserver.
It will also install docker and docker-compose on your hosts before doing anything else. 

You can try it with Vagrant, simply by running `vagrant up`

Example pillars can be found in pillar.example

An example .gitlab-ci.yml is included, you can easily adapt it the CI/CD you use, just by forking the repo (which you should do anyways, to ensure that the behaviour remains identical in the event of an update).

In order to not have to trigger a highstate on all hosts, it is limited by the use of a grain.

This formula is made for Debian 10.
