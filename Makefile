## help |-| Display this help message
.PHONY: help
help: Makefile
	@sed -n 's/^## /make /p' $< | column -ts '|'

## services-up |-| Lift up Localstack and Terraform services on Docker
.PHONY: services-up
services-up:
	@echo "======================================Set up Localstack & Terraform================================"
	docker compose up -d

## tf-init |-| Executes a terraform init
.PHONY: tf-init
tf-init: 
	docker compose run --rm terraform init

## tf-fmt |-| Executes a terraform fmt
.PHONY: tf-fmt
tf-fmt: 
	docker compose run --rm terraform fmt

## tf-plan |-| Executes a terraform plan
.PHONY: tf-plan
tf-plan: 
	docker compose run --rm terraform plan

## tf-apply |-| Executes a terraform apply
.PHONY: tf-apply
tf-apply:
	docker compose run --rm terraform apply

## tf-destroy |-| Executes a terraform destroy
.PHONY: tf-destroy
tf-destroy: 
	docker compose run --rm terraform destroy
