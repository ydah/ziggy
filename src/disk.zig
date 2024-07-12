const std = @import("std");

pub const DiskManager = struct {
    heap_file: std.fs.File,
    next_page_id: u64,
};
