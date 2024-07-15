const disk = @import("disk.zig");
const PageId = disk.PageId;

pub const Header = struct {
    prev_page_id: PageId,
    next_page_id: PageId,
};

pub const Leaf = struct {
    header: Header,
    body: []u8,

    pub fn init(bytes: anytype) Leaf {
        return Leaf{
            .header = Header{
                .prev_page_id = bytes[0..PageId.size],
                .next_page_id = bytes[PageId.size .. 2 * PageId.size],
            },
            .body = bytes[2 * PageId.size ..],
        };
    }
};
