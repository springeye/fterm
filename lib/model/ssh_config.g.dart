// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssh_config.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SSHConfigAdapter extends TypeAdapter<SSHConfig> {
  @override
  final int typeId = 1;

  @override
  SSHConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SSHConfig(
      id: fields[1] as String,
      title: fields[2] == null ? '' : fields[2] as String,
      host: fields[3] == null ? '' : fields[3] as String,
      port: fields[4] == null ? 0 : fields[4] as int,
      username: fields[5] == null ? '' : fields[5] as String,
      password: fields[6] as String?,
      privateKey: fields[7] as String?,
      passphrase: fields[8] as String?,
      authType: fields[9] as AuthType,
      jumpServer: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SSHConfig obj) {
    writer
      ..writeByte(10)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.host)
      ..writeByte(4)
      ..write(obj.port)
      ..writeByte(5)
      ..write(obj.username)
      ..writeByte(6)
      ..write(obj.password)
      ..writeByte(7)
      ..write(obj.privateKey)
      ..writeByte(8)
      ..write(obj.passphrase)
      ..writeByte(9)
      ..write(obj.authType)
      ..writeByte(10)
      ..write(obj.jumpServer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SSHConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AuthTypeAdapter extends TypeAdapter<AuthType> {
  @override
  final int typeId = 2;

  @override
  AuthType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return AuthType.auto;
      case 2:
        return AuthType.password;
      case 3:
        return AuthType.key;
      default:
        return AuthType.auto;
    }
  }

  @override
  void write(BinaryWriter writer, AuthType obj) {
    switch (obj) {
      case AuthType.auto:
        writer.writeByte(1);
        break;
      case AuthType.password:
        writer.writeByte(2);
        break;
      case AuthType.key:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ConnectTypeAdapter extends TypeAdapter<ConnectType> {
  @override
  final int typeId = 2;

  @override
  ConnectType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return ConnectType.direct;
      case 2:
        return ConnectType.proxy;
      default:
        return ConnectType.direct;
    }
  }

  @override
  void write(BinaryWriter writer, ConnectType obj) {
    switch (obj) {
      case ConnectType.direct:
        writer.writeByte(1);
        break;
      case ConnectType.proxy:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConnectTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
