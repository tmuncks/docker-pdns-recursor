check_latest:
	docker run --rm -ti alpine:edge apk search --no-cache pdns-recursor

build:
	docker build . --no-cache -t tmuncks/pdns-recursor:latest
	docker tag tmuncks/pdns-recursor:latest tmuncks/pdns-recursor:4.1.12
	docker tag tmuncks/pdns-recursor:latest tmuncks/pdns-recursor:4.1.12-$(shell date +%Y%m%d%H%M)

push:
	docker push tmuncks/pdns-recursor:latest
	docker push tmuncks/pdns-recursor:4.1.12
	docker push tmuncks/pdns-recursor:4.1.12-$(shell date +%Y%m%d%H%M)
