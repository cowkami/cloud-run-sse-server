docker build -t cloud-run-sse-server . --no-cache --platform linux/amd64
docker tag cloud-run-sse-server asia-northeast1-docker.pkg.dev/sse-unseo/sse-image/sse-test:latest
docker push asia-northeast1-docker.pkg.dev/sse-unseo/sse-image/sse-test:latest
gcloud run deploy sse-server --image asia-northeast1-docker.pkg.dev/sse-unseo/sse-image/sse-test:latest --project sse-unseo --region asia-northeast1
