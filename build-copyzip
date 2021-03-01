#!/bin/sh
for file in $(find overlay/ -name copyright); do
	cp $file copyright-$(basename $(dirname $file)).txt
done
zip copyright.zip copyright-*.txt
rm -f copyright-*.txt
