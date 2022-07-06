github-backup via docker container
=============
![](https://img.shields.io/github/stars/nicholas0g/docker-github-backup.svg) ![](https://img.shields.io/github/forks/nicholas0g/docker-github-backup.svg) ![](https://img.shields.io/docker/pulls/nicholas0g/docker-github-backup)

This project is based on [python-ghithub-backup](https://github.com/josegonzalez/python-github-backup) by [josegonzalez](https://github.com/josegonzalez)

Requirements
============

 - Docker

Usage
============

Warning: if no WAIT variable is specified, the container will constantly backup the selected repos every 12hs

Run the container to backup user repos every 12hs

    docker run -e USER=github_user -e TOKEN=github_token -v where_to_save:/app/repositories nicholas0g/github-backup --name=github-backup

Run the container to backup organization repos every 12hs

    docker run -e ORG=github_org -e TOKEN=github_token -v where_to_save:/app/repositories --name=github-backup nicholas0g/github-backup

Run the container to backup organization repos every 24hs

    docker run -e ORG=github_org -e TOKEN=github_token -e WAIT=24 -v where_to_save:/app/repositories --name=github-backup nicholas0g/github-backup

Use Docker compose

    version: "3"
    services:
    github-backup:
        image: nicholas0g/github-backup
        environment:
        ORG: ${ORG}
        TOKEN: ${TOKEN}
        USER: ${USER}
        WAIT: ${WAIT}
        volumes:
        - ./backup:/app/repositories

And run
    
    docker-compose up

Detail
=====

You need to provide your github username using the variable USER or the github Organization you want to backup using the variable ORG. If both variable are used the container will only save the repository of the organizaion. You alwais need to provide a valid github token using the variable TOKEN. By default the container will perform a backup operation every 12hs. To set this time in a different way you just need to set the variable WAIT in hours.

Get you github token
==============

To get your token simply go to https://github.com/settings/tokens/ and generate a new token with the repo scopes

