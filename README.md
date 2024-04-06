# Setting Up Pretix Instances with Docker
Introduction
This guide provides instructions on setting up Pretix instances using Docker, a containerization platform. Pretix is an open-source ticketing system known for its flexibility, ideal for study associations and similar organizations. By following these steps, you can quickly deploy Pretix instances on Virtual Private Servers (VPS) either owned by the organization or on your own VPS for short-term purposes.

**Prerequisites**
Access to a VPS or a Docker-supported environment.
Basic understanding of Docker and containerization concepts.
A reverse proxy, to keep it simple you can use nginx proxy manager in Docker.
Access to the DNS of the domain you wish to use.
Optionally, a container manager like Portainer

**Before installation**

Create the folderstructure

```bash
mkdir -p /mnt/docker/pretix/data
mkdir -p /mnt/docker/pretix/conf
chown -R 15371:15371 /mnt/docker/pretix/ 
mkdir -p /mnt/docker/pretix/postgresql
```

**Installation using portainer**

Step 1: Ensure Docker is installed on your VPS. If not, follow the official installation guide for your operating system.

Step 2: Download the Dockerfile, pretix.cfg, and docker-compose.yml files and place them in an acccesible folder on your VPS, then edit the files to meet your needs. Put your config file for the pretix installation to /mnt/docker/pretix/conf/pretix.cfg.

Step 3: On Portainer, go to Images, Build a new image, name your image (i.e. pretix-with-plugins) and upload the Dockerfile.

Step 4: Go the stacks, Create Stack, name your stack, upload the docker-compose.yml file. Make sure the pretix.cfg is in a reachable place and the volumes are defined correctly! Deploy the stack.

Step 5: Get a cup of coffee, this might take a minute.

Step 6: Once the container are running and you see no errors, make sure your reverse proxy points at the correct port and visit your fresh ticketsystem at subdomain.domain.tld/**control** (i.e. tickets.mydomain.com/control)

**Installation using docker compose**

Step 1: Ensure Docker is installed on your VPS. If not, follow the official installation guide for your operating system.

Step 2: Download the Dockerfile, pretix.cfg, and docker-compose.yml files and place them in an acccesible folder on your VPS, then edit the files to meet your needs. Put your config file for the pretix installation to /mnt/docker/pretix/conf/pretix.cfg.

Step 3: run the command 
```bash
docker build . -t pretix-with-plugins
```

Step 4: run the command
```bash
docker compose up
```

Step 5: Get a cup of coffee, this might take a minute.

Step 6: Once the container are running and you see no errors, make sure your reverse proxy points at the correct port and visit your fresh ticketsystem at subdomain.domain.tld/**control** (i.e. tickets.mydomain.com/control)


Conclusion
You've successfully set up a Pretix instance using Docker! You can now customize and manage your ticketing system efficiently. Refer to the Pretix documentation for advanced configuration and usage.
