# Flutter Trip Advisor App
## Internationalization (i18s) support
#### Jak korzystać z różnych narodowości?
- należy zaimportować bibliotekę `import 'I18n.dart';`
- zdefiniować w pliku _I18n.dart_ stringi, których chcemy użyć, np.: 
  ```dart
  // for base string
  String get attractionName {
    return Intl.message(
      'Matthias Church',
      name: 'attractionName',
      locale: localeName,
    );
  }
  // for string requiring parameters
  String radius(rad) => Intl.message(
      'Radius $rad km',
      name: 'radius',
      args: [rad],
      desc: 'radius',
      locale: localeName,
      );
  ```
- pobierać je w dowolnym module za pomocą: 
  ```dart
  AdvisorLocalizations.of(context).attractionName)
  ```
  lub
  ```dart
  Text(AdvisorLocalizations.of(context).radius(_kmRadius.toString())),
  ```
  **\* UWAGA:** Musi być dostęp do `BuildContext context` w danym obiekcie.

#### Jak dodawać nowe tłumaczenia?
- Run below line to generate *.arb text files:
  ```dart
  flutter pub run intl_translation:extract_to_arb --output-dir=lib/Locale lib/*.dart
  ```
- Fill up translations manually: 
  - Copy _intl_messages.arb_ to _intl_en.arb_ and _intl_pl.arb_, and translate Polish equivalents in _intl_pl.arb_ adequatelly. 
- Run below line to generate messages class for the app to import
```dart
flutter pub run intl_translation:generate_from_arb --output-dir=lib/Locale --no-use-deferred-loading lib/*.dart lib/Locale/intl_*.arb
```