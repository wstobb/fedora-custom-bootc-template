# Custom Fedora Atomic Image

This repository serves as a base system for creating your own custom Fedora images. Bootc images are just OCI containers so you can easily customize and redeploy them. Podman, Github Actions, and bash are used for customizing the image. When the template is used, its action is automatically enabled with a sane cron schedule.

## Usage

Use this repository as a template. In the `Containerfile` you can change the base image. Add packages and services to the configuration lists.

### Switching

On your atomic desktop, run:

```
sudo bootc switch ghcr.io/[username]/[image_name]
```

## Components

### Containerfile

```Dockerfile
FROM quay.io/fedora/fedora-bootc:44
```

The FROM statement is where you can set the base container and version. You do not need to edit anything else.

### Scripts

These are the bash scripts that run through the configuration lists. You do not have to edit them, but for advanced use cases you may need to create your own (example: custom kernel). If you create your own, add it to `00-build.sh`.

### Configuration Lists

These are list files where you configure your image. Each entry must be separated by a newline. They are located under the `config` directory.

`install_packages.list`
```
firefox
obs-studio
materia-kde
```

### System Root

`sys_root` is where you put files that you want copied to the image's root file system. You can put configuration files here and other stuff you want to distribute.