import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ssh_config.g.dart';

@HiveType(typeId: 2)
enum AuthType {
  @HiveField(1)
  auto,
  @HiveField(2)
  password,
  @HiveField(3)
  key
}

@JsonSerializable()
@HiveType(typeId: 1)
class SSHConfig {
  @HiveField(1)
  String id; // you can also use id = null to auto increment

  @HiveField(2, defaultValue: "")
  String title;
  @HiveField(3, defaultValue: "")
  String host;
  @HiveField(4, defaultValue: 0)
  int port;
  @HiveField(5, defaultValue: "")
  String username;
  @HiveField(6)
  String? password;
  @HiveField(7)
  String? privateKey;
  @HiveField(8)
  String? passphrase;
  @HiveField(9)
  AuthType authType;
  @HiveField(10)
  int jumpServer = 0;

  SSHConfig({
    required this.id,
    required this.title,
    required this.host,
    this.port = 22,
    required this.username,
    this.password,
    this.privateKey,
    this.passphrase,
    this.authType = AuthType.auto,
    this.jumpServer = 0,
  });

  SSHConfig copyWith({
    String? id,
    String? title,
    String? host,
    int? port,
    String? username,
    String? password,
    String? privateKey,
    String? passphrase,
    int? jumpServer,
  }) {
    return SSHConfig(
      id: id ?? this.id,
      title: title ?? this.title,
      host: host ?? this.host,
      port: port ?? this.port,
      username: username ?? this.username,
      password: password ?? this.password,
      privateKey: privateKey ?? this.privateKey,
      passphrase: passphrase ?? this.passphrase,
      jumpServer: jumpServer ?? this.jumpServer,
    );
  }

  @override
  String toString() {
    return 'SSHConfig{id: $id, title: $title, host: $host, port: $port, username: $username, password: $password, privateKey: $privateKey, passphrase: $passphrase, authType: $authType, jumpServer: $jumpServer}';
  }

  factory SSHConfig.fromJson(Map<String, dynamic> json) =>
      _$SSHConfigFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SSHConfigToJson(this);
}
