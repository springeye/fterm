// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssh_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SSHConfig _$SSHConfigFromJson(Map<String, dynamic> json) => SSHConfig(
      id: json['id'] as String,
      title: json['title'] as String,
      host: json['host'] as String,
      port: json['port'] as int? ?? 22,
      username: json['username'] as String,
      password: json['password'] as String?,
      privateKey: json['privateKey'] as String?,
      passphrase: json['passphrase'] as String?,
      authType: $enumDecodeNullable(_$AuthTypeEnumMap, json['authType']) ??
          AuthType.auto,
      jumpServer: json['jumpServer'] as String?,
    );

Map<String, dynamic> _$SSHConfigToJson(SSHConfig instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'host': instance.host,
      'port': instance.port,
      'username': instance.username,
      'password': instance.password,
      'privateKey': instance.privateKey,
      'passphrase': instance.passphrase,
      'authType': _$AuthTypeEnumMap[instance.authType]!,
      'jumpServer': instance.jumpServer,
    };

const _$AuthTypeEnumMap = {
  AuthType.auto: 'auto',
  AuthType.password: 'password',
  AuthType.key: 'key',
};
