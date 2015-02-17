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
