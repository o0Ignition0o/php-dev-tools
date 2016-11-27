# PHP dev tools


These are the base images I use to develop on my php-symfony projects.
With the right symlinks setup I can run PHP5.6 and PHP7 composer - phpcs phpunit and PHP commands.
 
This project is released under the [WTFPL](LICENSE) license.
## Purpose

This is a tweaked version of a tutorial provided by [OriginalBrownBear](http://obrown.io/) named [Dockerize PhpUnit and Force Idea/PhpStorm to Use it!
](http://obrown.io/2015/12/23/phpunit-docker-phpstorm.html)

This tweaked version includes a usermod command to avoid permission troubles when running commands outside and within containers.

All the commands run within the container are run as www-data. 

This is the best tradeoff I've found so far to avoid permission / cache / log errors when running symfony commands around docker environments.

If you came up with an other idea feel free to contact me to discuss it ! :)

## Create the docker images

In the root folder run 
`make build-all`

## Remove the docker images

In the root folder run
`make rm-all`

Refer to the [Makefile](Makefile) if you want to build and remove specific images only. 

## Run predefined commands

If you want to run predefined commands, you can run the corresponding files with your own parameters, eg:

`php7/composer7 update`

Notice you can also make a symlink to your /usr/local/bin/ folder to run the command in any folder you want to

## Run other commands

If you want to run an other command in the container (eg bash), you can use docker commands eg:

`docker run -it php7 bash`