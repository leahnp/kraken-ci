#!/bin/bash -
#title           :utils.sh
#description     :utils
#author          :Samsung SDSRA
#==============================================================================
while [[ $# > 0 ]]
do
key="$1"

case $key in
  --aws-key)
  export AWS_ACCESS_KEY_ID="$2"
  shift
  ;;
  --aws-secret)
  export AWS_SECRET_ACCESS_KEY="$2"
  shift
  ;;
  --aws-region)
  export AWS_DEFAULT_REGION="$2"
  shift
  ;;
  --aws-prefix)
  export AWS_PREFIX="$2"
  shift
  ;;
  --slack-token)
  export SLACK_API_TOKEN="$2"
  shift
  ;;
  --slack-hook-token)
  export SLACK_WEBHOOK_TOKEN="$2"
  shift
  ;;
  --github-id)
  export GITHUB_CLIENT_ID="$2"
  shift
  ;;
  --github-key)
  export GITHUB_CLIENT_KEY="$2"
  shift
  ;;
  --github-org)
  export GITHUB_ORG="$2"
  shift
  ;;
  --github-user)
  export GITHUB_USERNAME="$2"
  shift
  ;;
  --github-token)
  export GITHUB_ACCESS_TOKEN="$2"
  shift
  ;;
  --dump-data)
  export DUMP_JENKINS_DATA="$2"
  shift
  ;;
  --help)
  echo "setup | destroy.sh --aws-key <aws key> --aws-secret <aws secret> --aws-region <aws region>\
  --aws-prefix <aws user prefix> --slack-token <slack api token> --github-id <github app id>\
  --github-key <github app key> --github-org <github org> --slack-hook-token <outgoing hook token>\
  --dump-data <dump existing jenkins data: yes or no>"
  exit 0
  ;;
  *)
    # unknown option
  ;;
esac
shift # past argument or value
done

if [ -z ${AWS_ACCESS_KEY_ID+x} ]; then
  echo "AWS_ACCESS_KEY_ID is not set. Specify wither through environment variable or --aws-key"
  exit 1
fi

if [ -z ${AWS_SECRET_ACCESS_KEY+x} ]; then
  error "AWS_SECRET_ACCESS_KEY is not set. Specify wither through environment variable or --aws-secret"
  exit 1
fi

if [ -z ${AWS_DEFAULT_REGION+x} ]; then
  echo "AWS_DEFAULT_REGION is not set. Specify wither through environment variable or --aws-region"
  exit 1
fi

if [ -z ${AWS_PREFIX+x} ]; then
  echo "AWS_PREFIX is not set. Specify wither through environment variable or --aws-prefix"
  exit 1
fi

if [ -z ${SLACK_API_TOKEN+x} ]; then
  echo "SLACK_API_TOKEN is not set. Specify wither through environment variable or --slack-token"
  exit 1
fi

if [ -z ${SLACK_WEBHOOK_TOKEN+x} ]; then
  echo "SLACK_WEBHOOK_TOKEN is not set. Specify wither through environment variable or --slack-hook-token"
  exit 1
fi

if [ -z ${GITHUB_CLIENT_ID+x} ]; then
  echo "GITHUB_CLIENT_ID is not set. Specify wither through environment variable or --github-id"
  exit 1
fi

if [ -z ${GITHUB_CLIENT_KEY+x} ]; then
  echo "GITHUB_CLIENT_KEY is not set. Specify wither through environment variable or --github-key"
  exit 1
fi

if [ -z ${GITHUB_ORG+x} ]; then
  echo "GITHUB_ORG is not set. Specify wither through environment variable or --github-org"
  exit 1
fi

if [ -z ${GITHUB_USERNAME+x} ]; then
  echo "GITHUB_USERNAME is not set. Specify wither through environment variable or --github-user"
  exit 1
fi

if [ -z ${GITHUB_ACCESS_TOKEN+x} ]; then
  echo "GITHUB_ACCESS_TOKEN is not set. Specify wither through environment variable or --github-token"
  exit 1
fi

if [ -z ${DUMP_JENKINS_DATA+x} ]; then
  export DUMP_JENKINS_DATA=False
fi