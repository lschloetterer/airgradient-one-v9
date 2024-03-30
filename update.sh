#!/bin/bash -e

rgbFunction="\
void setRGBledCO2color(int co2Value) { \n\
  if (co2Value <= 0) return; \n\
  co2Value = min(co2Value, 3000); // don't calculate hue beyond 3000 to not return green again \n\
  uint16_t hue = map(co2Value, 500, 1800, UINT16_MAX/3 /*green*/, 0 /*red*/); \n\
  ag.ledBar.setHue(hue); \n\
}"

wget https://raw.githubusercontent.com/airgradienthq/arduino/master/examples/ONE/ONE.ino -O src/main.ino
sed -i -e 's/hw.airgradient.com/airgradient.internal/g' \
    -e "/void setRGBledCO2color(int co2Value) {/,/^}/c$rgbFunction" \
    -e '/serverSchedule.run();/s/^/\/\//g' \
    -e '/configSchedule.run();/s/^/\/\//g' \
    -e '/sendPing();/s/^/\/\//g' \
    -e '/MQTT sync success/a\              resetWatchdog();' \
    src/main.ino
#git add src/main.ino
#git commit -m "chore: update from upstream repo"
#git push
