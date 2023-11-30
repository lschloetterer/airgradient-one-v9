# Firmware for Airgradient ONE v9

based on https://github.com/airgradienthq/arduino

## Changes
- APIROOT URL set to airgradient.internal
- included patched PMS Library version from Airgradient website
- added PlatformIO configuration

## Updating
Use the `update.sh` script which downloads the newest version from
the Airgradient GitHub repo and automatically replaces the APIROOT
with airgradient.internal

## References
- Build instructions: https://www.airgradient.com/open-airgradient/instructions/pro-v9/
- Installation instructions: https://www.airgradient.com/blog/install-arduino-c3-mini/
- Source code: https://github.com/airgradienthq/arduino
- Detailed installation instructions with solution to compilation errors: https://www.cnx-software.com/2023/11/29/airgradient-one-kit-review-an-open-source-indoor-air-quality-monitor/
- Patched PMS Library code: https://www.airgradient.com/blog/patching-pms-library-for-plantower-pms5003t/
