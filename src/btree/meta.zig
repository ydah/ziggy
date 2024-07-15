pub const disk = @import("disk.zig").DiskManager;
pub const PageId = disk.PageId;

pub const Header = struct {
    root_page_id: PageId,
};

pub const Meta = struct {
    const Self = @This();

    header: Header,
    _unused: []u8,

    pub fn init(bytes: anytype) Self {
        return Self{
            .header = Header{ .root_page_id = bytes[0..PageId.size].read(PageId) },
            ._unused = bytes[PageId.size..],
        };
    }
};
