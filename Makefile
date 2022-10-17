SHELL := bash

INSTALLER_URL := \
    https://raw.githubusercontent.com/bpan-org/bpan/main/share/install

default:

build: index.html

index.html: head.html install.sh foot.html
	@( \
	  echo '#!/usr/bin/env bash'; \
	  echo; \
	  cat \
	    <(head=$$(< head.html); echo '# '$$head) \
	    install.sh \
	    <(foot=$$(< foot.html); echo '# '$$foot) \
	) >$@
	rm install.sh

install.sh:
	curl -s $(INSTALLER_URL) > $@
