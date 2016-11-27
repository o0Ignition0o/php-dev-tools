build-all: build-56 build-7

build-56:
	docker build -t jeremylempereur/php-tools:56 php56/ && docker build -t jeremylempereur/php-tools:56-dev php56-dev/

build-7:
	docker build -t jeremylempereur/php-tools:7 php7/ && docker build -t jeremylempereur/php-tools:7-dev php7-dev/

rm-all: rm-56 rm-7
rm-56:
	docker rmi jeremylempereur/php-tools:56 -f && docker rmi jeremylempereur/php-tools:56-dev -f
rm-7:
	docker rmi jeremylempereur/php-tools:7 -f && docker rmi jeremylempereur/php-tools:7-dev -f