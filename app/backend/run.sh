#!/bin/bash

# ECR Bilgileri
AWS_ACCOUNT_ID="your-account-id"
REGION="your-aws-region"
REPOSITORY_NAME="your-ecr-repo-name"
DOCKER_IMAGE_TAG="your-image-tag"

# AWS CLI ile giriş yapın (gerektiğinde kimlik bilgilerinizi girin)
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

# Docker görüntüsünü oluşturun (Varsa bu adımı geçebilirsiniz)
docker build -t $REPOSITORY_NAME:$DOCKER_IMAGE_TAG .

# Docker görüntüsünü ECR'e yükleyin
docker tag $REPOSITORY_NAME:$DOCKER_IMAGE_TAG $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPOSITORY_NAME:$DOCKER_IMAGE_TAG
docker push $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/$REPOSITORY_NAME:$DOCKER_IMAGE_TAG

# Başarılı bir şekilde tamamlandı mesajı
echo "Docker görüntüsü başarıyla ECR'e yüklendi: $REPOSITORY_NAME:$DOCKER_IMAGE_TAG"
