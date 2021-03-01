all: overlay.squashfs copyright.zip

overlay.squashfs:
	./build-overlay
	mksquashfs overlay overlay.squashfs -comp lzo -all-root -noappend -no-xattrs -no-recovery -b 1048576

copyright.zip: overlay.squashfs
	./build-copyzip

clean:
	rm -rf overlay.squashfs copyright.zip overlay

.PHONY: all clean
