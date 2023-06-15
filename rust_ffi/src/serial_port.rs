use flutter_rust_bridge::{frb};
pub use serialport::{SerialPortInfo, SerialPortType, UsbPortInfo};
#[frb(mirror(SerialPortInfo))]
pub struct _SerialPortInfo{
    pub port_name:String,
    pub port_type:SerialPortType
}
#[frb(mirror(SerialPortType))]
pub enum _SerialPortType{
    /// The serial port is connected via USB
    UsbPort(UsbPortInfo),
    /// The serial port is connected via PCI (permanent port)
    PciPort,
    /// The serial port is connected via Bluetooth
    BluetoothPort,
    /// It can't be determined how the serial port is connected
    Unknown,
}
#[frb(mirror(UsbPortInfo))]
pub struct _UsbPortInfo{
    /// Vendor ID
    pub vid: u16,
    /// Product ID
    pub pid: u16,
    /// Serial number (arbitrary string)
    pub serial_number: Option<String>,
    /// Manufacturer (arbitrary string)
    pub manufacturer: Option<String>,
    /// Product name (arbitrary string)
    pub product: Option<String>,
    /// Interface (id number for multiplexed devices)
    #[cfg(feature = "usbportinfo-interface")]
    pub interface: Option<u8>,
}
pub fn list() -> Vec<SerialPortInfo> {
    let ports = serialport::available_ports().expect("No ports found!");
    ports
}
