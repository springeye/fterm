use std::time::Duration;
use flutter_rust_bridge::{DartOpaque, frb, opaque_dyn, RustOpaque};
pub use serialport::{SerialPortInfo, SerialPortType, UsbPortInfo};
pub use serialport::SerialPort;

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
// #[frb]
//  pub extern "C" fn open(path:String,
//             #[frb(default = "115200")]
//             baud_rate:u32,
//             #[frb(default = "10")]
//             timeout_millis:u64) -> Box<dyn SerialPort> {
//     let port = serialport::new(path, baud_rate)
//         .timeout(Duration::from_millis(timeout_millis))
//         .open().expect("Failed to open port");
//     return port;
//
// }
