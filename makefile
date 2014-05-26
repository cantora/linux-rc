
INSTALL_PREFIX=/usr/local

.PHONY: install
install: vconsole-conf

.PHONY: vconsole-conf
vconsole-conf: $(INSTALL_PREFIX)/etc/vconsole.conf
	cd /etc && ln -fs $<

$(INSTALL_PREFIX)/etc/vconsole.conf: $(INSTALL_PREFIX)/share/key.map
	mkdir -p $(dir $@)
	cp vconsole.conf $@

$(INSTALL_PREFIX)/share/key.map:
	mkdir -p $(dir $@)
	cp key.map $@

.PHONY: uninstall
uninstall:
	rm -f /etc/vconsole.conf
	rm -f $(INSTALL_PREFIX)/etc/vconsole.conf
	rm -f $(INSTALL_PREFIX)/share/key.map

