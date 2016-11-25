build-all: build-56 build-7

build-56:
	docker build -t php56 php56/ && docker build -t php56-dev php56-dev/

build-7:
	docker build -t php7 php7/ && docker build -t php7-dev php7-dev/

rm-all: rm-56 rm-7
rm-56:
	docker rmi php56 -f && docker rmi php56-dev -f
rm-7:
	docker rmi php7 -f && docker rmi php7-dev -f