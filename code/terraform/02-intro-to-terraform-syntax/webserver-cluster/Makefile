.PHONY: init plan apply

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply --auto-approve

output:
	-terraform output

clean:
	terraform apply --destroy --auto-approve
