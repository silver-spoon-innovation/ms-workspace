project:=ms-sssm

.PHONY: default
default: update start

.PHONY: start
start: 
	- bash ./bin/start.sh

.PHONY: stop
stop: 
	- bash ./bin/stop.sh

.PHONY: update
update:
	- bash ./bin/checkout.sh

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