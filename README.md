# Semantic Versioning Web Service Helper

This is a very simple web service that I created to scratch an itch. I got
sick of having to make CI bits with semver versioning. I also wanted to start
a project in golang after hacking about with it for ages and because of scratch
container images.

By default port 8000 is exposed.

## Building

Building:

You should never need to do this, but you can with 'make build'.

Testing:

This can be done via 'make test', the tests are currently in cucumber under Ruby.

Docker:

To build a docker container, modify the Makefile to adjust the naming of the created
image and run 'make docker'

## Usage

Start your container using directly or using the provided kubernetes rc.json and
service.json or via the fleed/systemd service file provided.

If you must start the container via docker directly.

## Contributing

Pull requests welcome.
