#!/bin/bash

wget https://raw.githubusercontent.com/airgradienthq/arduino/master/examples/ONE_V9/ONE_V9.ino -O src/main.ino
sed -i 's/hw.airgradient.com/airgradient.internal/g' src/main.ino # replace URL
sed -i '/PM_RAW_0_3/s/^/\/\//g' src/main.ino # comment out problematic line
git add src/main.ino
git commit -m "update from upstream repo"
#git push
