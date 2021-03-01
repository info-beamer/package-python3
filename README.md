# Python3 service template

This package bundles a Python3 runtime into a
[overlay.squashfs file](https://info-beamer.com/doc/package-services#customoverlay).
info-beamer OS will detect this file and mount it as an overlay into the
package service's filesystem. This makes Python3.7 available for use in
your `service`.

The first time python3 is invoked it will precompile some python modules
and save the result in the package's
[scratch directory](https://info-beamer.com/doc/package-services#scratchdirectory).

## Using in your own package

1. Copy `overlay.squashfs` into your package. 
1. Invoke `python3` as your package service's interpreter.

## Building this package

The included build-overlay and Makefile can be used to create the included
`overlay.squashfs`. Right now this packages uses Raspbian OS (buster) packages
instead of building its own binaries. Place the following files from the
Raspbian deb archive into the directory `debs`, for example by using
`apt-get download`:

```
libpython3-stdlib_3.7.3-1_armhf.deb
libpython3.7-minimal_3.7.3-2+deb10u2_armhf.deb
libpython3.7-stdlib_3.7.3-2+deb10u2_armhf.deb
python3-certifi_2018.8.24-1_all.deb
python3-chardet_3.0.4-3_all.deb
python3-idna_2.6-1_all.deb
python3-pkg-resources_40.8.0-1_all.deb
python3-requests_2.21.0-1_all.deb
python3-six_1.12.0-1_all.deb
python3-urllib3_1.24.1-1_all.deb
python3.7-minimal_3.7.3-2+deb10u2_armhf.deb
python3.7_3.7.3-2+deb10u2_armhf.deb
python3_3.7.3-1_armhf.deb
```

Then invoke `make` and you'll end up with a new version of `overlay.squashfs`.
