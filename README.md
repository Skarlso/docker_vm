# Docker runtime VM with Alpine Linux

This is lightweight alpine based docker runtime vm for those who do not want to run the Docker Toolbox on
OSX or Windows. This is much more convenient and avoids all the pitfalls and problems like high CPU usage
of the Docker Toolbox / hypervisor implementation.

This VM is thin and configurable and easy to set up / use.

# Prerequisite

```
vagrant plugin install vagrant-alpine
vagrant plugin install vagrant-env
```

And install [Vagrant](https://www.vagrantup.com/downloads.html).

# Usage

The base resources for a singel VM are 6GB of ram and 2 CPU cores.

Change these in the Vagrant file directly or by using these environment properties:

```
DOCKER_VM_MEMORY
DOCKER_VM_CPU
DOCKER_VM_NAME
```

To run the VM simply type:

```
vagrant up
```

**IMPORTANT**: Once this completes, to access the docker daemon the vm **has to be restarted**. Thus, once everything is installed, run:

```
vagrant reload
```

Now, you are ready to use docker. To get into your vm run:

```
vagrant ssh
```

This will give you a prompt for the vagrant user which is set up to be able to run and access docker commands.

Composer is also installed.

# Portforwarding

The VM by default forwards port 8989 and 32768. Further ports can be defined as follows (comma separated list):

```
DOCKER_VM_PORTS="1234,3155,333,1234"
```

Unfortunately by the nature of a VM these will only be applied upon a restart if the vm happens to be running.
