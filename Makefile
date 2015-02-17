clean:
	rm semver-ci
all: docker
	echo "Done"

build:
	CGO_ENABLED=0 GOOS=linux go build -a -tags netgo -ldflags '-w' .

test: build
	bundle install
	./semver-ci &
	bundle exec cucumber

docker: test
	docker build -t shift/semver-ci .

update:
	git add semver-ci
	git commit -m "Automatic update for registry build."
	git push origin
	curl --data "build=true" -X POST https://registry.hub.docker.com/u/shift/semver-ci/trigger/7a251434-0f2f-44d3-8483-d8cb61153d63/
