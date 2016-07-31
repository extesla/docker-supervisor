#!/bin/bash
# Copyright (c) 2015, Extesla LLC.
#
# It is illegal to use, reproduce or distribute any part of this
# Intellectual Property without prior written authorization from
# Extesla LLC.

set -e

ENTRYPOINT=/usr/bin/supervisord

echo -e "[INFO ] Starting container application..."
echo -e "[DEBUG] $ $ENTRYPOINT $@"
$ENTRYPOINT "$@"
