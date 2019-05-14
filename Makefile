REGISTRY = gcr.io/rosy-decker-240108
IMAGE_API = $(REGISTRY)/demo-api:$(shell cat api/tag)
IMAGE_FRONTEND = $(REGISTRY)/demo-frontend:$(shell cat frontend/tag)

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

frontend-build:
	$(info Building frontend image...)
	docker build -t $(IMAGE_FRONTEND) frontend

frontend-push:
	$(info Pushing frontend image...)
	docker push $(IMAGE_FRONTEND)

frontend-release: frontend-build frontend-push

frontend-deploy:
	$(info Deploying frontend image...)
	kubectl apply -f frontend/deployment.yml