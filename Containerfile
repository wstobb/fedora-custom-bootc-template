# Create workspace for scripts
FROM scratch as ctx
# Copy repo to workspace
COPY / /
# Base image selection
FROM quay.io/fedora/fedora-bootc:44
# Run build script and commit
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/scripts/00-build.sh \
    ostree container commit
