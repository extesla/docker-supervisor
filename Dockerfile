# Copyright (c) 2015, Extesla LLC.
#
# It is illegal to use, reproduce or distribute any part of this
# Intellectual Property without prior written authorization from
# Extesla LLC.

FROM extesla/alpine
MAINTAINER Sean Quinn "sean.quinn@extesla.com"

RUN apk add --no-cache supervisor \
    && sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisord.conf \
    && sed -i 's/^\(files = .*\)$/;\1/' /etc/supervisord.conf \
    && sed -i 's/^\(\[include\]\)$/\1\nfiles = \/etc\/supervisor\/conf.d\/*.conf/' /etc/supervisord.conf

#: Add /etc/supervisor/conf.d directory for program *.ini files.
RUN mkdir -p /etc/supervisor/conf.d

COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["-c", "/etc/supervisord.conf"]
