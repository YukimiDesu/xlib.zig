const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const xlib_mod = b.addModule("xlib", .{
        .root_source_file = b.path("src/xlib.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    xlib_mod.linkSystemLibrary("X11", .{}); 
 }
