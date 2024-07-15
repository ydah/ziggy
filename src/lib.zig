/// A pure Zig RDBMS.
pub const Self: type = @This();

pub const buffer = @import("buffer.zig");
pub const disk = @import("disk.zig");
pub const btree = @import("btree.zig");
