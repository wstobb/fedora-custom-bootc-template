# Create workspace for scripts
FROM scratch as build
# Copy repo to workspace
COPY / /
# Base image selection
FROM quay.io/fedora/fedora-bootc:44
# Run build script and commit
RUN --mount=type=bind,from=build,source=/,target=/build \
    /build/scripts/00-build.sh \
    ostree container commit
