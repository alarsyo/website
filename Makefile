.PHONY: all serve clean

all: clean
	hugo --verbose

server: clean
	hugo server

clean:
	rm -rf public/
