// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
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
  String get localeName => 'pl';

  static m0(error) => "Wystąpił błąd: ${error}";

  static m1(rad) => "Promień ${rad} km";

  final messages = _notInlinedMessages(_notInlinedMessages);

  static _notInlinedMessages(_) => <String, Function>{
        "airports": MessageLookupByLibrary.simpleMessage("Lotniska"),
        "attractionDescription": MessageLookupByLibrary.simpleMessage(
            "Używana przez wieki jako kościół koronacyjny dla węgierskich królów, smukła i pełna wdzięku architektura tego pięknego kościoła dominuje na głównym placu Zamku."),
        "attractionName":
            MessageLookupByLibrary.simpleMessage("Kościół Macieja"),
        "attractions": MessageLookupByLibrary.simpleMessage("Atrakcje"),
        "errorOccurred": m0,
        "hotels": MessageLookupByLibrary.simpleMessage("Hotele"),
        "locationsSearchBarHintText": MessageLookupByLibrary.simpleMessage(
            "Nazwy miast, regionów, miejsc, itd."),
        "noResultsFound":
            MessageLookupByLibrary.simpleMessage("Nie znaleziono wyników"),
        "radius": m1,
        "restaurants": MessageLookupByLibrary.simpleMessage("Restauracje"),
        "searching": MessageLookupByLibrary.simpleMessage("Wyszukiwanie..."),
        "title": MessageLookupByLibrary.simpleMessage("Doradzacz podróży"),
        "distance": MessageLookupByLibrary.simpleMessage("Dystans: "),
        "rating": MessageLookupByLibrary.simpleMessage("Ocena: ")
      };
}
