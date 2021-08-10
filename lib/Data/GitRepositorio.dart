import 'dart:convert';

import 'GitOwner.dart';

class GitRepositorio {
  int? id;
  String? node_id;
  String? name;
  String? full_name;
  String? description;
  String? html_url;
  int? forks;
  int? stargazers_count;
  int? open_issues;
  int? open_issues_count;
  String? created_at;
  GitOwner? owner;

  GitRepositorio({
    this.id,
    this.node_id,
    this.name,
    this.full_name,
    this.description,
    this.html_url,
    this.forks,
    this.stargazers_count,
    this.open_issues,
    this.open_issues_count,
    this.created_at,
    this.owner,
  });

  GitRepositorio copyWith({
    int? id,
    String? node_id,
    String? name,
    String? full_name,
    String? description,
    String? html_url,
    int? forks,
    int? stargazers_count,
    int? open_issues,
    int? open_issues_count,
    String? created_at,
    GitOwner? owner,
  }) {
    return GitRepositorio(
      id: id ?? this.id,
      node_id: node_id ?? this.node_id,
      name: name ?? this.name,
      full_name: full_name ?? this.full_name,
      description: description ?? this.description,
      html_url: html_url ?? this.html_url,
      forks: forks ?? this.forks,
      stargazers_count: stargazers_count ?? this.stargazers_count,
      open_issues: open_issues ?? this.open_issues,
      open_issues_count: open_issues_count ?? this.open_issues_count,
      created_at: created_at ?? this.created_at,
      owner: owner ?? this.owner,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'node_id': node_id,
      'name': name,
      'full_name': full_name,
      'description': description,
      'html_url': html_url,
      'forks': forks,
      'stargazers_count': stargazers_count,
      'open_issues': open_issues,
      'open_issues_count': open_issues_count,
      'created_at': created_at,
      'owner': owner?.toMap(),
    };
  }

  factory GitRepositorio.fromMap(Map<String, dynamic> map) {
    return GitRepositorio(
      id: map['id'],
      node_id: map['node_id'],
      name: map['name'],
      full_name: map['full_name'],
      description: map['description'] ?? '',
      html_url: map['html_url'],
      forks: map['forks'],
      stargazers_count: map['stargazers_count'],
      open_issues: map['open_issues'],
      open_issues_count: map['open_issues_count'],
      created_at: map['created_at'],
      owner: GitOwner.fromMap(map['owner']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GitRepositorio.fromJson(Map<String, dynamic> source) =>
      GitRepositorio.fromMap(source);

  @override
  String toString() {
    return 'GitRepositorio(id: $id, node_id: $node_id, name: $name, full_name: $full_name, description: $description, html_url: $html_url, forks: $forks, stargazers_count: $stargazers_count, open_issues: $open_issues, open_issues_count: $open_issues_count, created_at: $created_at, owner: $owner)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GitRepositorio &&
        other.id == id &&
        other.node_id == node_id &&
        other.name == name &&
        other.full_name == full_name &&
        other.description == description &&
        other.html_url == html_url &&
        other.forks == forks &&
        other.stargazers_count == stargazers_count &&
        other.open_issues == open_issues &&
        other.open_issues_count == open_issues_count &&
        other.created_at == created_at &&
        other.owner == owner;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        node_id.hashCode ^
        name.hashCode ^
        full_name.hashCode ^
        description.hashCode ^
        html_url.hashCode ^
        forks.hashCode ^
        stargazers_count.hashCode ^
        open_issues.hashCode ^
        open_issues_count.hashCode ^
        created_at.hashCode ^
        owner.hashCode;
  }

  /*
 GitOwner({
    this.id,
    this.login,
    this.avatar_url,
  });

  GitOwner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    login = json['login'];
    avatar_url = json['avatar_url'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'login': this.login,
      'avatar_url': this.avatar_url,
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['login'] = this.login;
    data['avatar_url'] = this.avatar_url;
    return data;
  }

  */

}
