# PHPUnit Docker Container.

[Docker](https://www.docker.com) container to install and run [PHPUnit](https://www.phpunit.de/).

This container assumes all dependencies (including PHPUnit) are defined in a composer.json file in your project. The `phpunit` executable should be installed in `vendor/bin` in the application directory.

## Installation / Usage

1. Install the opennemas/phpunit container:

    ``` sh
	$ docker pull opennemas/phpunit
	```

2. Create a phpunit.xml defining your tests suites.

    ``` xml
    ...
    ```

3. Run PHPUnit through the PHPUnit container:

    ``` sh
	$ docker run -v $(pwd):/app --rm opennemas/phpunit run
    ```
    or in shorthand add
    ``` sh
	$ sudo sh -c "printf \"#!/bin/sh
    export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
    docker run -v $(pwd):/app --rm opennemas/phpunit run \\\$@
    \" > /usr/local/bin/phpunit"
	$ sudo chmod +x /usr/local/bin/phpunit
    ```
    and then from host machine just
    ``` sh
	$ phpunit --version
    ```

To run, test and develop the PHPUnit Dockerfile itself, you must use the source directly:

1. Download the source:

    ``` sh
	$ git clone https://github.com/openhost/opennemas-phpunit.git
    ```

2. Switch to the opennemas-phpunit directory:

    ``` sh
	$ cd opennemas-phpunit
    ```

3. Build the container:

    ``` sh
	$ docker build -t opennemas/phpunit .
    ```

4. Test running the container:

    ``` sh
	$ docker run opennemas/phpunit --help
	```
