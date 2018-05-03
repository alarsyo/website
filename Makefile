.PHONY: all serve clean update-theme

all: clean
	hugo -D --verbose

server: clean
	hugo server -D

release: clean
	hugo --verbose

update-theme:
	git submodule update --recursive --remote

clean:
	rm -rf public/
