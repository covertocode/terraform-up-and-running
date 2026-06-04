DIRS := one-server one-webserver one-webserver-with-vars webserver-cluster

.PHONY: init plan apply

init: # init each dir
	$(foreach dir,$(DIRS),$(MAKE) -C "$(dir)" init || exit $$?;)


plan: # plan each dir
	$(foreach dir,$(DIRS),$(MAKE) -C "$(dir)" plan || exit $$?;)

apply: # apply each dir
	$(foreach dir,$(DIRS),$(MAKE) -C "$(dir)" apply || exit $$?;)

all: init plan apply

output: # output each dir
	$(foreach dir,$(DIRS),$(MAKE) -C "$(dir)" output || exit $$?;)

clean: # destroy all resources
	$(foreach dir,$(DIRS),$(MAKE) -C "$(dir)" clean || exit $$?;)
