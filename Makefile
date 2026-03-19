TEST         ?= ./...
TESTARGS     ?=
TEST_COUNT   ?= 1
TEST_TIMEOUT ?= 20m
GPG_FINGERPRINT ?= 77149598955C8ABFF8AA0834A55E40E2DFD8EE50

.PHONY: default
default: build

.PHONY: build
build:
	go install

.PHONY: testacc
testacc:
	go build ./...
	TF_ACC=1 go test $(TEST) -v -count $(TEST_COUNT) -timeout $(TEST_TIMEOUT) $(TESTARGS)
