# docker-formula

This is a saltstack formula to deploy docker containers and docker compose files (server directly from your Salt master, using the built in fileserver salt://)

You can try it with Vagrant, simply by running `vagrant up`

Example pillars can be found in pillar.example

An example .gitlab-ci.yml is included, you can easily adapt it the CI/CD you use, just by forking the repo (which you should do anyways, to ensure that the behaviour remains identical in the event of an update).

In order to not have to trigger a highstate on all hosts, it is limited by the use of a grain.
