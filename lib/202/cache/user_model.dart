class User {
  String? name;
  String? description;
  String? url;

  User({
    this.name,
    this.description,
    this.url,
  });

  @override
  List<Object?> get props => [name, description, url];

  User copyWith({
    String? name,
    String? description,
    String? url,
  }) {
    return User(
      name: name ?? this.name,
      description: description ?? this.description,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'url': url,
    };
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
    );
  }
}
