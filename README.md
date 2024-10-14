# Firmware for Airgradient ONE v9

based on https://github.com/airgradienthq/arduino

## Changes
- RGB strip shows gradual changes in CO2 value by calculating hue dynamically
- automatic firmware update check disabled
- added PlatformIO configuration

## Updating
Run `patch-airgradient-lib.sh` to change the files inside the Airgradient lib.

## Disabling cloud connection
Use Airgradient local server API to set custom config values
`curl -X PUT -H "Content-Type: application/json" -d '{"configurationControl": "local", "postDataToAirGradient": false, "mqttBrokerUrl": "mqtt://user:password@mqtt-server:1883", "country": "DE"}' http://airgradient-ip/config`

## References
- Build instructions: https://www.airgradient.com/open-airgradient/instructions/pro-v9/
- Installation instructions: https://www.airgradient.com/blog/install-arduino-c3-mini/
- Source code: https://github.com/airgradienthq/arduino
- Detailed installation instructions with solution to compilation errors (patching the PMS Library is not needed anymore): https://www.cnx-software.com/2023/11/29/airgradient-one-kit-review-an-open-source-indoor-air-quality-monitor/
- Patched PMS Library code: https://www.airgradient.com/blog/patching-pms-library-for-plantower-pms5003t/
