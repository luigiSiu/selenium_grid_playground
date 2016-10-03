
help: ## Prints this help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'

test: ## Runs tests
	$(info Starting tests...)
	-@docker-compose build
	-@docker-compose scale nodeff=2
	@docker-compose run selenium_grid_playground 
	make clean-run

clean-run: ## Deletes all Docker containers
	$(info Cleaning images...)
	-@docker-compose down --rmi local

