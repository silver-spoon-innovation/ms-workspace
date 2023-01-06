project:=ms-sssm

.PHONY: default
default: update start

.PHONY: start
start: 
	- ./bin/start.sh

.PHONY: stop
stop: 
	- ./bin/stop.sh

.PHONY: update
update:
	- ./bin/checkout-linux

.PHONY: ps
ps:
	- @docker ps -a --format="table {{ .ID }}\\t{{ .Names }}\\t{{ .Status }}\\t{{ .Image }}\\t{{ .Ports }}" -f network=${project}_default

.PHONY: proxystart
proxystart:
	docker-compose -p ${project} up -d

.PHONY: proxystop
proxystop:
	docker-compose -p ${project} down

.PHONY: logs
logs:
	docker-compose -p ${project} logs -t