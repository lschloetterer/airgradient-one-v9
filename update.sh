#!/bin/bash -e

rgbFunction="\
void setRGBledCO2color(int co2Value) { \n\
  if (co2Value < 300) return; \n\
  uint16_t hue = map(co2Value, 800, 2000, 65535/3, 0); \n\
  uint32_t rgbcolor = pixels.ColorHSV(hue); \n\
  pixels.fill(rgbcolor); \n\
  pixels.show(); \n\
}"

wget https://raw.githubusercontent.com/airgradienthq/arduino/master/examples/ONE_V9/ONE_V9.ino -O src/main.ino
sed -i -e 's/hw.airgradient.com/airgradient.internal/g' \
    -e "/void setRGBledCO2color(int co2Value) {/,/}/c$rgbFunction" \
    src/main.ino
git add src/main.ino
git commit -m "chore: update from upstream repo"
#git push
