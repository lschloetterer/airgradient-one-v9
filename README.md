# Firmware for Airgradient ONE v9

based on https://github.com/airgradienthq/arduino

## Changes
- API URL hw.airgradient.com set to airgradient.internal
- sending measurements via HTTP disabled
- inital ping to server on startup is disabled
- HTTP config endpoint is only called once on startup, not on a schedule
- hardware watchdog reset after sending mqtt message
- RGB strip shows gradual changes in CO2 value by calculating hue dynamically
- added PlatformIO configuration

# Using local config endpoint
A json object is expected at the webserver config endpoint.
Here is an example configuration using Caddy:

```
http://airgradient.internal {
  respond /sensors/airgradient:SERIALNO/one/config `{"country": "DE", "pmStandard": "ugm3", "co2CalibrationRequested": false, "ledBarMode": "co2", "model": "onev9", "mqttBrokerUrl": "mqtt://user:password@mqtt-server:1883", "abcDays": -1, "ledBarTestRequested": false}` 200
  respond "request blocked" 403
}
```

replace SERIALNO with the serial number of your device

## Updating
Use the `update.sh` script which downloads the newest version from
the Airgradient GitHub repo and automatically pastes the aforementioned changes
into the file

## References
- Build instructions: https://www.airgradient.com/open-airgradient/instructions/pro-v9/
- Installation instructions: https://www.airgradient.com/blog/install-arduino-c3-mini/
- Source code: https://github.com/airgradienthq/arduino
- Detailed installation instructions with solution to compilation errors (patching the PMS Library is not needed anymore): https://www.cnx-software.com/2023/11/29/airgradient-one-kit-review-an-open-source-indoor-air-quality-monitor/
- Patched PMS Library code: https://www.airgradient.com/blog/patching-pms-library-for-plantower-pms5003t/
