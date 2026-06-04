DIRS := one-server one-webserver one-webserver-with-vars webserver-cluster

.PHONY: init plan apply

init:
	# Use make's foreach expansion to init each dir
	$(foreach dir,$(DIRS),$(MAKE) -C "$(dir)" init || exit $$?;)


plan:
	# Use make's foreach expansion to plan each dir
	$(foreach dir,$(DIRS),$(MAKE) -C "$(dir)" plan || exit $$?;)

apply:
	# Use make's foreach expansion to apply each dir
	$(foreach dir,$(DIRS),$(MAKE) -C "$(dir)" apply || exit $$?;)

all: init plan apply
