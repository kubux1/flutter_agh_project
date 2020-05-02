#!/bin/bash

# Run below line to generate *.arb text files
flutter pub run intl_translation:extract_to_arb --output-dir=lib/Locale lib/*.dart
# Fill up translations manually
# Run below line to generate messages class for the app to import

#flutter pub run intl_translation:generate_from_arb --output-dir=lib/Locale --no-use-deferred-loading lib/*.dart lib/Locale/intl_*.arb