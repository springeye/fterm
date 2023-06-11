use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_insert(port_: i64, path: *mut wire_uint_8_list, host: *mut wire_Host) {
    wire_insert_impl(port_, path, host)
}

#[no_mangle]
pub extern "C" fn wire_update(port_: i64, path: *mut wire_uint_8_list, host: *mut wire_Host) {
    wire_update_impl(port_, path, host)
}

#[no_mangle]
pub extern "C" fn wire_delete(port_: i64, path: *mut wire_uint_8_list, id: *mut wire_uint_8_list) {
    wire_delete_impl(port_, path, id)
}

#[no_mangle]
pub extern "C" fn wire_findAll(port_: i64, path: *mut wire_uint_8_list) {
    wire_findAll_impl(port_, path)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_box_autoadd_host_0() -> *mut wire_Host {
    support::new_leak_box_ptr(wire_Host::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_uint_8_list_0(len: i32) -> *mut wire_uint_8_list {
    let ans = wire_uint_8_list {
        ptr: support::new_leak_vec_ptr(Default::default(), len),
        len,
    };
    support::new_leak_box_ptr(ans)
}

// Section: related functions

// Section: impl Wire2Api

impl Wire2Api<String> for *mut wire_uint_8_list {
    fn wire2api(self) -> String {
        let vec: Vec<u8> = self.wire2api();
        String::from_utf8_lossy(&vec).into_owned()
    }
}
impl Wire2Api<Host> for *mut wire_Host {
    fn wire2api(self) -> Host {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<Host>::wire2api(*wrap).into()
    }
}
impl Wire2Api<Host> for wire_Host {
    fn wire2api(self) -> Host {
        Host {
            id: self.id.wire2api(),
            title: self.title.wire2api(),
            host: self.host.wire2api(),
            port: self.port.wire2api(),
            username: self.username.wire2api(),
            password: self.password.wire2api(),
            private_key: self.private_key.wire2api(),
        }
    }
}

impl Wire2Api<Vec<u8>> for *mut wire_uint_8_list {
    fn wire2api(self) -> Vec<u8> {
        unsafe {
            let wrap = support::box_from_leak_ptr(self);
            support::vec_from_leak_ptr(wrap.ptr, wrap.len)
        }
    }
}
// Section: wire structs

#[repr(C)]
#[derive(Clone)]
pub struct wire_Host {
    id: *mut wire_uint_8_list,
    title: *mut wire_uint_8_list,
    host: *mut wire_uint_8_list,
    port: u32,
    username: *mut wire_uint_8_list,
    password: *mut wire_uint_8_list,
    private_key: *mut wire_uint_8_list,
}

#[repr(C)]
#[derive(Clone)]
pub struct wire_uint_8_list {
    ptr: *mut u8,
    len: i32,
}

// Section: impl NewWithNullPtr

pub trait NewWithNullPtr {
    fn new_with_null_ptr() -> Self;
}

impl<T> NewWithNullPtr for *mut T {
    fn new_with_null_ptr() -> Self {
        std::ptr::null_mut()
    }
}

impl NewWithNullPtr for wire_Host {
    fn new_with_null_ptr() -> Self {
        Self {
            id: core::ptr::null_mut(),
            title: core::ptr::null_mut(),
            host: core::ptr::null_mut(),
            port: Default::default(),
            username: core::ptr::null_mut(),
            password: core::ptr::null_mut(),
            private_key: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_Host {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}

// Section: sync execution mode utility

#[no_mangle]
pub extern "C" fn free_WireSyncReturn(ptr: support::WireSyncReturn) {
    unsafe {
        let _ = support::box_from_leak_ptr(ptr);
    };
}
