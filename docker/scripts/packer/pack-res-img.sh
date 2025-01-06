#!/bin/bash

echo "Generate resource"

rm -rf resource
mkdir -p resource

convert \
    -size 640x360 \
    -background black \
    -gravity center -font "DejaVu-Sans" -pointsize 64 -fill white label:"U-Boot" \
    BMP3:resource/bootup.bmp

cat <<EOF >resource/list.txt
090000:bootup:bootup.bmp
EOF
AmlImg res_pack build/resource.img resource/
