check_latest:
	# determine latest version of pdns-recursor
	# then determine latest version of a matching lua library for prcre regex
	docker run --rm -ti alpine:edge ash -c 'apk update ; echo "-----" ; apk search --exact pdns-recursor ; apk search $$(apk info --provides $$(apk info --depends pdns-recursor | grep "lua") | grep " provides:" | cut -d- -f1)-rex-pcre'

version = 4.1.14

build:
	docker build . --no-cache -t tmuncks/pdns-recursor:latest
	docker tag tmuncks/pdns-recursor:latest tmuncks/pdns-recursor:$(version)
	docker tag tmuncks/pdns-recursor:latest tmuncks/pdns-recursor:$(version)-$(shell date +%Y%m%d)

push:
	docker push tmuncks/pdns-recursor:latest
	docker push tmuncks/pdns-recursor:$(version)
	docker push tmuncks/pdns-recursor:$(version)-$(shell date +%Y%m%d)
