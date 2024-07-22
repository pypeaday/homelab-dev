
https://github.com/drape-io/terraform-kubernetes-local-cluster

CA_CERTS_FOLDER=$(pwd)/.certs && \
    echo ${CA_CERTS_FOLDER} && \
    mkdir -p ${CA_CERTS_FOLDER} && \
    CAROOT=${CA_CERTS_FOLDER} mkcert -install
