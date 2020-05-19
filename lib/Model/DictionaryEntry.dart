

class DictionaryEntry{
  String key;
  String name;

  DictionaryEntry({
    this.key,
    this.name
  });

  factory DictionaryEntry.fromJson(Map<String, dynamic> json) {
    return DictionaryEntry(
      key: json['key'] ?? "",
      name: json['name'] ?? ""
    );
  }
}