# Testing bundle images

## Dependency

- [goss](https://github.com/aelsabbahy/goss)

## Configuration

1. Check all variables in [/.env](../blob/master/.env)
2. Tests are located in [/goss.yaml](../blob/master/goss.yaml)
3. For running test check first also [/Makefile](../blob/master/Makefile)

## Run tests

By passing this command at the command line:

```shell
make all
```

1. Build the image
2. Unpack image
3. Unpacked files from image is tested by goss

## Add test

### Files

All files related to the image will be available under `/tests/verify/`

Start with `make all` to get these files.

Now you can add more test by running [goss](https://github.com/aelsabbahy/goss). `goss add --help`

Or by editing [/goss.yaml](../blob/master/goss.yaml) file.

## Validate existing image

Make sure about [/bundle.env](../blob/master/.env) `IMAGE=activemq-artemis`

```shell
make verify-image IMAGE=activemq-artemis
```
