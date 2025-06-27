#!/bin/bash
set -e
if [ ! -e debs ]; then
    echo "'debs' directory missing. See README.md"
    exit 1
fi
rm -rf overlay
mkdir -p overlay
cd overlay
for deb in ../debs/*.deb; do
    DATA=$(ar t $deb|grep data)
    echo $deb $DATA

    if [ $DATA == "data.tar.gz" ]; then
        ar p $deb $DATA|tar xz
    elif [ $DATA == "data.tar.bz2" ]; then
        ar p $deb $DATA|tar xj
    else
        ar p $deb $DATA|tar xJ
    fi
done
for dir in \
    usr/lib/python3.11 \
    usr/lib/python3.11/asyncio \
    usr/lib/python3.11/encodings \
    usr/lib/python3.11/importlib \
    usr/lib/python3.11/multiprocessing \
    usr/lib/python3.11/urllib \
    usr/lib/python3/dist-packages \
    usr/lib/python3/dist-packages/certifi \
    usr/lib/python3/dist-packages/chardet \
    usr/lib/python3/dist-packages/idna \
    usr/lib/python3/dist-packages/requests \
    usr/lib/python3/dist-packages/urllib3 \
    usr/lib/python3/dist-packages/urllib3/util \
; do
    ln -sf /tmp/python3-cache/$dir $dir/__pycache__
done
cat <<'EOF' > usr/bin/python3
#!/bin/sh
mkdir -p ${SCRATCH}/.python3-cache
ln -sf ${SCRATCH}/.python3-cache /tmp/python3-cache 
if [ ! -e /tmp/python3-cache/compiled ]; then
  find /usr/lib -name __pycache__ -exec mkdir -p "/tmp/python3-cache/{}" +
  echo "[*] precompiling python3 modules"
  python3.11 -mcompileall /usr/lib/python3 -qq
  python3.11 -mcompileall /usr/lib/python3.11 -qq
  touch /tmp/python3-cache/compiled 
fi
exec /usr/bin/python3.11 "$@"
EOF
chmod 755 usr/bin/python3
