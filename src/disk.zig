const std = @import("std");

const PAGE_SIZE = 4096;

pub const DiskManager = struct {
    heap_file: std.fs.File,
    next_page_id: u64,

    pub fn init(heap_file: std.fs.File) !DiskManager {
        const file_info = try heap_file.stat();
        const heap_file_size = file_info.size;
        const next_page_id = heap_file_size / PAGE_SIZE;

        return DiskManager{
            .heap_file = heap_file,
            .next_page_id = next_page_id,
        };
    }

    pub fn open(heap_file_path: []const u8) !DiskManager {
        const fs = std.fs;
        const file = try fs.cwd().openFile(heap_file_path, fs.File.OpenFlags{
            .read = true,
            .write = true,
            .create = true,
        });

        return try DiskManager.init(file);
    }
};
