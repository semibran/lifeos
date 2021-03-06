# GNU Make 3.8.2 and above

MAKEFLAGS += --no-print-directory

.EXPORT_ALL_VARIABLES:
.PHONY: clean html css js json assets start

PATH := $(PWD)/node_modules/.bin:$(PATH)
SHELL := /bin/bash

clean:
	rm -rf dist tmp
	mkdir tmp
	mkdir -p dist

html:
	cp src/popup.html dist/popup.html

css:
	sass src/style.scss dist/style.css

js:
	esbuild src/background.js --bundle --sourcemap --outfile=dist/background.js
	esbuild src/popup.js --bundle --sourcemap --outfile=dist/popup.js

json:
	cp src/manifest.json dist/manifest.json

assets:
	cp -r src/assets dist

start: clean js css html assets json
	chokidar "src/**/*.js" -c "$(MAKE) js" \
	& chokidar "src/**/*.scss" -c "$(MAKE) css" \
	& chokidar "src/*.html" -c "$(MAKE) html" \
	& chokidar "src/assets/*" -c "$(MAKE) assets" \
	& chokidar "src/manifest.json" -c "$(MAKE) json"
