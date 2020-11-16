#!/usr/bin/env bash

echo "Cleaning up Dev"
pushd dev/ec2
terraform destroy
popd

pushd dev/securitygroup
terraform destroy
popd

echo "Cleaning up Test"
pushd test/ec2
terraform destroy
popd

pushd test/securitygroup
terraform destroy
popd
