.PHONY: all serve clean update-theme

all: clean
	hugo -D --verbose

server: clean
	hugo server -D

release: clean
	hugo --verbose

update-theme:
	git add themes/my-simple-theme
	git commit -m "Update theme"

clean:
	rm -rf public/
