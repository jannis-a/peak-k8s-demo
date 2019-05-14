REGISTRY = gcr.io/rosy-decker-240108
IMAGE_API = $(REGISTRY)/demo-api:$(shell cat api/tag)

api-build:
	$(info Building API image...)
	docker build -t $(IMAGE_API) api

api-push:
	$(info Pushing API image...)
	docker push $(IMAGE_API)

api-release: api-build api-push

api-deploy:
	$(info Deploying API image...)
	kubectl apply -f api/deployment.yml