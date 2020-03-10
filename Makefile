name = pdns-recursor
version = 4.3.0

check_latest:
	# determine latest version of dnsdist
	docker pull ubuntu:bionic
	docker run --rm -it ubuntu:bionic bash -c 'echo "deb [arch=amd64] http://repo.powerdns.com/ubuntu bionic-rec-43 main" >> /etc/apt/sources.list \
	&& apt-get -o "Acquire::AllowInsecureRepositories=true" update \
	&& apt-cache show --no-all-versions pdns-recursor'
	
build:
	docker pull ubuntu:bionic
	docker build . --no-cache -t tmuncks/$(name):latest
	docker tag tmuncks/$(name):latest tmuncks/$(name):$(version)
	docker tag tmuncks/$(name):latest tmuncks/$(name):$(version)-$(shell date +%Y%m%d)

push:
	docker push tmuncks/$(name):latest
	docker push tmuncks/$(name):$(version)
	docker push tmuncks/$(name):$(version)-$(shell date +%Y%m%d)

