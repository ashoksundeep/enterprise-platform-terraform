fmt:
	terraform fmt -recursive terraform/

validate:
	cd terraform/live/10-network/azure/dev && terraform validate

lint:
	tflint --recursive

docs:
	terraform-docs markdown table terraform/modules/azure/network > terraform/modules/azure/network/README.md

checkov:
	checkov -d terraform/

bootstrap:
	./scripts/bootstrap/install-dev-tools.sh
