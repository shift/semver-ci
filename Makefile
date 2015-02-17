all: docker
	echo "Done"

build:
	go get github.com/pointlander/peg
	go get github.com/harlanji/gogherkit
	CGO_ENABLED=0 GOOS=linux go build -a -tags netgo -ldflags '-w' .

test: build
	bundle install
	bundle exec cucumber

docker: test
	docker build -t shift/semver-ci .
