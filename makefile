all: data.min.json hash

data.min.json: data.json
	node ./build_tools/minifyDataJSON.js $< $@

hash: data.min.json
	sha256sum data.min.json | awk '{print $$1}' > $<.sha256

clean:
	rm -f data.min.json data.min.json.sha256

.PHONY: hash clean