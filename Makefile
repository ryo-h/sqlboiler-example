all: setup build

setup:
	go get -u github.com/golang/dep/cmd/dep
	dep ensure

build: setup
	go build -o app.out src/app/main.go