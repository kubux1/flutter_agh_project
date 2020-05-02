// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(error) => "Error occurred : ${error}";

  static m1(rad) => "Radius ${rad} km";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "airports" : MessageLookupByLibrary.simpleMessage("Airports"),
    "attractionDescription" : MessageLookupByLibrary.simpleMessage("Used over the centuries as a coronation church for the Hungarian kings, the slender and graceful architecture of this beautiful church dominates the main square of the Castle area."),
    "attractionName" : MessageLookupByLibrary.simpleMessage("Matthias Church"),
    "attractions" : MessageLookupByLibrary.simpleMessage("Attractions"),
    "errorOccurred" : m0,
    "hotels" : MessageLookupByLibrary.simpleMessage("Hotels"),
    "locationsSearchBarHintText" : MessageLookupByLibrary.simpleMessage("Name of cities, districts, places, etc…"),
    "noResultsFound" : MessageLookupByLibrary.simpleMessage("No results found"),
    "radius" : m1,
    "restaurants" : MessageLookupByLibrary.simpleMessage("Restaurants"),
    "searching" : MessageLookupByLibrary.simpleMessage("Searching..."),
    "title" : MessageLookupByLibrary.simpleMessage("Location Advisor")
  };
}
