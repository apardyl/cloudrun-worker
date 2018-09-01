confdir := configs
scriptdir := scripts

confinstalldir := /etc/cloudrun
scriptinstalldir := /usr/local/bin

CONFSOURCES := $(shell find $(confdir) -type f)
CONFINSTALLTARGETS := $(CONFSOURCES:$(confdir)/%=$(confinstalldir)/%)
SCRIPTSOURCES := $(shell find $(scriptdir) -type f)
SCRIPTNSTALLTARGETS :=  $(SCRIPTSOURCES:$(scriptdir)/%=$(scriptinstalldir)/%)

$(confinstalldir)/%: $(confdir)/%
	@echo Installing $<
	@mkdir -p "$(@D)"
	cp $< $@

$(scriptinstalldir)/%: $(scriptdir)/%
	@echo Installing $<
	@mkdir -p "$(@D)"
	cp $< $@

install: $(CONFINSTALLTARGETS) $(SCRIPTNSTALLTARGETS)

uninstall:
	rm -f $(CONFINSTALLTARGETS)
	rmdir --ignore-fail-on-non-empty $(confinstalldir)
	rm -f $(SCRIPTNSTALLTARGETS)

.PHONY: install uninstall
