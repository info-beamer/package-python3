# Python3 service template

[![Import](https://cdn.infobeamer.com/s/img/import.png)](https://info-beamer.com/use?url=https://github.com/info-beamer/package-python3)

This package bundles a Python3 runtime into a
[overlay.squashfs file](https://info-beamer.com/doc/package-services#customoverlay).
info-beamer OS will detect this file and mount it as an overlay into the
package service's filesystem. This makes Python3.11 available for use in
your `service`.

The first time python3 is invoked it will precompile some python modules
and save the result in the package's
[scratch directory](https://info-beamer.com/doc/package-services#scratchdirectory).

## Using in your own package

1. Copy `overlay.squashfs` into your package. 
1. Invoke `python3` as your package service's interpreter.

## Building this package

The included build-overlay and Makefile can be used to create the included
`overlay.squashfs`. Right now this packages uses Raspbian OS (bookworm) packages
instead of building its own binaries. Place the [listed files](debs/download.txt) 
the directory `debs`, for example by using `apt-get download`.

Then invoke `make` and you'll end up with a new version of `overlay.squashfs`.
