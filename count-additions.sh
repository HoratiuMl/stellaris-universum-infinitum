#!/bin/bash

SUBMODS=$(ls -p | grep "ui-.*/")

# DIRECTORIES
ANOMALIES_DIR="common/anomalies"
BUILDINGS_DIR="common/buildings"
CELESTIAL_BODIES_DIR="common/random_names/base"
FLAG_DIR="flags"
FLAG_BACKGROUNDS_DIR="$FLAG_DIR/backgrounds"
GALAXY_SIZES_DIR="map/setup_scenarios"
NAME_LISTS_DIR="common/name_lists"
PLANETARY_MODIFIERS_DIR="common/planet_modifiers"
PRESCRIPTED_COUNTRIES_DIR="prescripted_countries"
SPECIES_NAMES_DIR="common/species_names"
STRATEGIC_RESOURCES_DIR="common/strategic_resources"
SYSTEM_INITIALISERS_DIR="common/solar_system_initializers"
DEPOSIT_BLOCKERS_DIR="common/deposit_blockers"

# INITIALISATIONS
ANOMALIES_COUNT=0
BUILDINGS_COUNT=0
CELESTIAL_BODIES_COUNT=0
FLAG_BACKGROUNDS_COUNT=0
FLAG_SYMBOLS_COUNT=0
GALAXY_SIZES_COUNT=0
NAME_LISTS_COUNT=0
PLANETARY_MODIFIERS_COUNT=0
PRESCRIPTED_COUNTRIES_COUNT=0
SPECIES_NAMES_COUNT=0
STRATEGIC_RESOURCES_COUNT=0
SYSTEM_INITIALISERS_COUNT=0
DEPOSIT_BLOCKERS_COUNT=0

# COUNT ADDITIONS
for SUBMOD in $SUBMODS; do
    if [ -d $SUBMOD/$CELESTIAL_BODIES_DIR ]; then
        CELESTIAL_BODIES_COUNT_SUBMOD=$(cat $SUBMOD/$CELESTIAL_BODIES_DIR/* | sed 's/ //g' | sed '/^\s*$\|=\|}\|^#/d' | uniq | wc -l)
        CELESTIAL_BODIES_COUNT=$((CELESTIAL_BODIES_COUNT + CELESTIAL_BODIES_COUNT_SUBMOD))
    fi
    
    if [ -d $SUBMOD/$FLAG_BACKGROUNDS_DIR ]; then
        FLAG_BACKGROUNDS_COUNT_SUBMOD=$(ls $SUBMOD/$FLAG_BACKGROUNDS_DIR | wc -l)
        FLAG_BACKGROUNDS_COUNT=$((FLAG_BACKGROUNDS_COUNT + FLAG_BACKGROUNDS_COUNT_SUBMOD))
    fi
    
    if [ -d $SUBMOD/$FLAG_DIR ]; then
        FLAG_SYMBOLS_COUNT_SUBMOD=$(find $SUBMOD/$FLAG_DIR -maxdepth 2 -type f | grep -v "^$SUBMOD/$FLAG_BACKGROUNDS_DIR" | wc -l)
        FLAG_SYMBOLS_COUNT=$((FLAG_SYMBOLS_COUNT + FLAG_SYMBOLS_COUNT_SUBMOD))
    fi
    
    if [ -d $SUBMOD/$GALAXY_SIZES_DIR ]; then
        GALAXY_SIZES_COUNT_SUBMOD=$(ls $SUBMOD/$GALAXY_SIZES_DIR | wc -l)
        GALAXY_SIZES_COUNT=$((GALAXY_SIZES_COUNT + GALAXY_SIZES_COUNT_SUBMOD))
    fi
    
    if [ -d $SUBMOD/$NAME_LISTS_DIR ]; then
        NAME_LISTS_COUNT_SUBMOD=$(ls $SUBMOD/$NAME_LISTS_DIR | wc -l)
        NAME_LISTS_COUNT=$((NAME_LISTS_COUNT + NAME_LISTS_COUNT_SUBMOD))
    fi
    
    if [ -d $SUBMOD/$PRESCRIPTED_COUNTRIES_DIR ]; then
        PRESCRIPTED_COUNTRIES_COUNT_SUBMOD=$(ls $SUBMOD/$PRESCRIPTED_COUNTRIES_DIR | wc -l)
        PRESCRIPTED_COUNTRIES_COUNT=$((PRESCRIPTED_COUNTRIES_COUNT + PRESCRIPTED_COUNTRIES_COUNT_SUBMOD))
    fi
    
    if [ -d $SUBMOD/$SYSTEM_INITIALISERS_DIR ]; then
        SYSTEM_INITIALISERS_COUNT_SUBMOD=$(ls $SUBMOD/$SYSTEM_INITIALISERS_DIR | wc -l)
        SYSTEM_INITIALISERS_COUNT=$((SYSTEM_INITIALISERS_COUNT + SYSTEM_INITIALISERS_COUNT_SUBMOD))
    fi
done

# PRINT RESULTS
echo "Anomalies:" $ANOMALIES_COUNT
echo "Buildings:" $BUILDINGS_COUNT
echo "Celestial bodies:" $CELESTIAL_BODIES_COUNT
echo "Flag backgrounds:" $FLAG_BACKGROUNDS_COUNT
echo "Flag symbols:" $FLAG_SYMBOLS_COUNT
echo "Galaxy sizes:" $GALAXY_SIZES_COUNT
echo "Name lists:" $NAME_LISTS_COUNT
echo "Planetary modifiers:" $PLANETARY_MODIFIERS_COUNT
echo "Prescripted countries:" $PRESCRIPTED_COUNTRIES_COUNT
echo "Species names:" $SPECIES_NAMES_COUNT
echo "Strategic resources:" $STRATEGIC_RESOURCES_COUNT
echo "System initialisers:" $SYSTEM_INITIALISERS_COUNT
echo "Deposit blockers:" $DEPOSIT_BLOCKERS_COUNT

