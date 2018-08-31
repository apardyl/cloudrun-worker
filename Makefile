install-configs:
	mkdir -p /etc/cloudrun
	cp -r configs/* /etc/cloudrun/

uninstall-configs:
	rm -rf /etc/cloudrun

.PHONY: install-configs uninstall-configs
