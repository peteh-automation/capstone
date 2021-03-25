#!/bin/bash

# Delete Load Balancer for app pods

kubectl delete -f service.yml
