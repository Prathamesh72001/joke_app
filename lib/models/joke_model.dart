class Joke {
  final String? type;
  final String? setup;
  final String? punchline;
  final int? id;

  Joke({
    this.type,
    this.setup,
    this.punchline,
    this.id,
  });

  // Factory constructor to create an instance from JSON
  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      type: json['type'],
      setup: json['setup'],
      punchline: json['punchline'],
      id: json['id'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'setup': setup,
      'punchline': punchline,
      'id': id,
    };
  }
}