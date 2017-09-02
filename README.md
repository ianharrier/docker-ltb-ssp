# docker-ltb-ssp

Dockerized LDAP Tool Box Self Service Password

### Contents

* [About](#about)
* [How-to guides](#how-to-guides)
    * [Installing](#installing)
    * [Uninstalling](#uninstalling)

## About

This repo uses [Docker](https://www.docker.com) and [Docker Compose](https://docs.docker.com/compose/) to automate the deployment of [Self Service Password](https://github.com/ltb-project/self-service-password).

## How-to guides

*Note: some of the commands in these guides may require root access to your system. If that is the case, either run the commands while logged in to the root account, or simulate a login to the root account using `sudo -i`. Due to the way environment variables are passed on some systems, typing `sudo` before each command is __not__ a supported method of running the commands in these guides with root access.*

### Installing

1. Ensure the following are installed on your system:

    * [Docker](https://docs.docker.com/engine/installation/)
    * [Docker Compose](https://docs.docker.com/compose/install/) **Warning: [installing as a container](https://docs.docker.com/compose/install/#install-as-a-container) is not supported.**
    * `git`

2. Clone this repo to a location on your system. *Note: in all of the guides on this page, it is assumed the repo is cloned to `/srv/docker/ssp`.*

    ```shell
    git clone https://github.com/ianharrier/docker-ltb-ssp.git /srv/docker/ssp
    ```

3. Set the working directory to the root of the repo.

    ```shell
    cd /srv/docker/ssp
    ```

4. Create the `.env` file using `.env.template` as a template.

    ```shell
    cp .env.template .env
    ```

5. Using a text editor, read the comments in the `.env` file, and make modifications to suit your environment.

    ```shell
    vi .env
    ```

6. Create the `config.php` file using `config.template.php` as a template.

    ```shell
    cp volumes/web/config.template.php volumes/web/config.php
    ```

7. Using a text editor, make modifications to the `config.php` file to suit your environment.

    ```shell
    vi volumes/web/config.php
    ```

8. Start Self Service Password in the background.

    ```shell
    docker-compose up -d
    ```

### Uninstalling

1. Set the working directory to the root of the repo.

    ```shell
    cd /srv/docker/ssp
    ```

2. Remove the application stack.

    ```shell
    docker-compose down
    ```

3. Delete the repo. **Warning: this step is optional. If you delete the repo, all of your Self Service Password data will be lost.**

    ```shell
    rm -rf /srv/docker/ssp
    ```
