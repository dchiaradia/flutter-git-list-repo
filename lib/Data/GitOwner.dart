import 'dart:convert';

class GitOwner {
  int? id;
  String? login;
  String? avatar_url;

  GitOwner({
    this.id,
    this.login,
    this.avatar_url,
  });

  GitOwner copyWith({
    int? id,
    String? login,
    String? avatar_url,
  }) {
    return GitOwner(
      id: id ?? this.id,
      login: login ?? this.login,
      avatar_url: avatar_url ?? this.avatar_url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'login': login,
      'avatar_url': avatar_url,
    };
  }

  factory GitOwner.fromMap(Map<String, dynamic> map) {
    return GitOwner(
      id: map['id'],
      login: map['login'],
      avatar_url: map['avatar_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GitOwner.fromJson(String source) =>
      GitOwner.fromMap(json.decode(source));

  @override
  String toString() =>
      'GitOwner(id: $id, login: $login, avatar_url: $avatar_url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GitOwner &&
        other.id == id &&
        other.login == login &&
        other.avatar_url == avatar_url;
  }

  @override
  int get hashCode => id.hashCode ^ login.hashCode ^ avatar_url.hashCode;
}
