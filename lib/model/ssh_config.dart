import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ssh_config.g.dart';

enum AuthType { auto, password, key }

enum ConnectType {
  direct,
  proxy,
}

@JsonSerializable()
@Entity(
  foreignKeys: [
    ForeignKey(
      childColumns: ['jump_server'],
      parentColumns: ['id'],
      entity: SSHConfig,
    )
  ],
)
class SSHConfig {
  @primaryKey
  String id; // you can also use id = null to auto increment

  String title;
  String host;
  int port;
  String username;
  String? password;
  String? privateKey;
  String? passphrase;
  AuthType authType;
  @ColumnInfo(name: 'jump_server')
  String? jumpServer;

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
    this.jumpServer,
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
    String? jumpServer,
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
      jumpServer: jumpServer,
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
