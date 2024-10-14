#!/bin/bash -e

# this adds the setHue() method to the AirGradient LedBar class for the custom CO2 RGB handler
patch .pio/libdeps/lolin_c3_mini/"AirGradient Air Quality Sensor"/src/Main/LedBar.h airgradient-lib-patches/LedBar.h.patch
patch .pio/libdeps/lolin_c3_mini/"AirGradient Air Quality Sensor"/src/Main/LedBar.cpp airgradient-lib-patches/LedBar.cpp.patch
# replaces default CO2 RGB handler
patch .pio/libdeps/lolin_c3_mini/"AirGradient Air Quality Sensor"/src/AgStateMachine.cpp airgradient-lib-patches/AgStateMachine.cpp.patch