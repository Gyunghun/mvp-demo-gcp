# Cloud Integration Platform for GCP

## 가이드

## How to launch
- Credential 위치는 아래처럼 환경 변수로 잡아서 쓰세요. 절대 업로드 하시면 안됩니다.
``` bash
export GOOGLE_CLOUD_KEYFILE_JSON="$HOME/keys/GCP/bm-platform-demo/credentials.json"

terraform init
terraform plan
terraform apply -auto-approve

```
