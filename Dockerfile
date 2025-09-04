# Note: this example assumes Holy Build Box 3.0.
# Specify the actual desired version here. You can see the list
# of available versions in our Changelog:
# https://github.com/FooBarWidget/holy-build-box/blob/master/Changelog.md
FROM ghcr.io/phusion/holy-build-box/hbb-64:rel-3.0.5
ADD install-deps.sh /install-deps.sh
RUN bash /install-deps.sh && rm -f /install-deps.sh

