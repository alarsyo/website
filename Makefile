.PHONY: all serve clean

all: clean
	hugo -D --verbose

server: clean
	hugo server -D

release: clean
	hugo --verbose

clean:
	rm -rf public/
