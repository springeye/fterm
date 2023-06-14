use super::*;
// Section: wire functions

#[no_mangle]
pub extern "C" fn wire_new_client(
    port_: i64,
    url: *mut wire_uint_8_list,
    username: *mut wire_uint_8_list,
    password: *mut wire_uint_8_list,
) {
    wire_new_client_impl(port_, url, username, password)
}

#[no_mangle]
pub extern "C" fn wire_write__method__DAVClient(
    port_: i64,
    that: *mut wire_DAVClient,
    path: *mut wire_uint_8_list,
    data: *mut wire_uint_8_list,
) {
    wire_write__method__DAVClient_impl(port_, that, path, data)
}

#[no_mangle]
pub extern "C" fn wire_read__method__DAVClient(
    port_: i64,
    that: *mut wire_DAVClient,
    path: *mut wire_uint_8_list,
) {
    wire_read__method__DAVClient_impl(port_, that, path)
}

// Section: allocate functions

#[no_mangle]
pub extern "C" fn new_box_autoadd_dav_client_1() -> *mut wire_DAVClient {
    support::new_leak_box_ptr(wire_DAVClient::new_with_null_ptr())
}

#[no_mangle]
pub extern "C" fn new_uint_8_list_1(len: i32) -> *mut wire_uint_8_list {
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
impl Wire2Api<DAVClient> for *mut wire_DAVClient {
    fn wire2api(self) -> DAVClient {
        let wrap = unsafe { support::box_from_leak_ptr(self) };
        Wire2Api::<DAVClient>::wire2api(*wrap).into()
    }
}
impl Wire2Api<DAVClient> for wire_DAVClient {
    fn wire2api(self) -> DAVClient {
        DAVClient {
            url: self.url.wire2api(),
            username: self.username.wire2api(),
            password: self.password.wire2api(),
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
pub struct wire_DAVClient {
    url: *mut wire_uint_8_list,
    username: *mut wire_uint_8_list,
    password: *mut wire_uint_8_list,
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

impl NewWithNullPtr for wire_DAVClient {
    fn new_with_null_ptr() -> Self {
        Self {
            url: core::ptr::null_mut(),
            username: core::ptr::null_mut(),
            password: core::ptr::null_mut(),
        }
    }
}

impl Default for wire_DAVClient {
    fn default() -> Self {
        Self::new_with_null_ptr()
    }
}
