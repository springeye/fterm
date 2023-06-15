part of 'shells_cubit.dart';

const freezed = Freezed(copyWith: true, equal: true);

@freezed
class ProfilesState with _$ProfilesState {
  const factory ProfilesState.initial(
    List<Item> items,
    String keyword,
  ) = _Initial;
}

@freezed
class Item with _$Item {
  const factory Item.hosts(
    String header,
    bool isExpanded,
    List<SSHConfig> hosts,
  ) = _Hosts;

  const factory Item.shells(
    String header,
    bool isExpanded,
    List<Shell> shells,
  ) = _Shells;

  const factory Item.serialPorts(
    String header,
    bool isExpanded,
    List<SerialPortInfo> ports,
  ) = _SerialPorts;
}
