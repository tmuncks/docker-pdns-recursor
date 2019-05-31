check_latest:
	# determine latest version of pdns-recursor
	# then determine latest version of a matching lua library for prcre regex
	docker run --rm -ti alpine:edge ash -c 'apk search --no-cache --exact pdns-recursor | grep -v "^fetch" ; apk search --no-cache $$(apk info --no-cache --provides $$(apk info --no-cache --depends pdns-recursor | grep "lua") | grep " provides:" | cut -d- -f1)-rex-pcre | grep -v "^fetch"'

version = "4.1.13"

build:
	docker build . --no-cache -t tmuncks/pdns-recursor:latest
	docker tag tmuncks/pdns-recursor:latest tmuncks/pdns-recursor:$(version)
	docker tag tmuncks/pdns-recursor:latest tmuncks/pdns-recursor:$(version)-$(shell date +%Y%m%d)

push:
	docker push tmuncks/pdns-recursor:latest
	docker push tmuncks/pdns-recursor:$(version)
	docker push tmuncks/pdns-recursor:$(version)-$(shell date +%Y%m%d)
